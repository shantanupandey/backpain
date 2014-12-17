package reminder;

import java.awt.Toolkit;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.TimeZone;
import java.util.Timer;
import java.util.TimerTask;
import java.util.Calendar;

import net.calba.backpain.dao.mybatis.CalbaMapper;
import net.calba.backpain.model.ClientListing;
import net.calba.backpain.service.AdminService;
import net.calba.backpain.service.impl.AdminServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;

/**
 * Simple demo that uses java.util.Timer to schedule a task to execute once 5
 * seconds have passed.
 */

public class ReminderBeep {

	public static AdminService adminService;
	Toolkit toolkit;

	Timer timer;

	public ReminderBeep(int seconds) {
		toolkit = Toolkit.getDefaultToolkit();
		timer = new Timer();
		timer.schedule(new RemindTask(), 10 * 1000);
	}

	public ReminderBeep() {

	}

	class RemindTask extends TimerTask {
		public void run() {
			int i;
			List<ClientListing> result = adminService.getMoniterListing();
			List<ClientListing> clientDetails = adminService.getUserListing();
			MailReminder mail = new MailReminder();

			Date now = new Date();
			int dateFlag = 0;

			DateFormat df = new SimpleDateFormat("HH");
			df.setTimeZone(TimeZone.getTimeZone("Europe/London"));

			String timeZone = df.format(now);
		
			int formSetId = 0;

			String userId = "";
			boolean flag;

			userId = result.get(0).getUserId();

			for (i = 0; i < result.size(); i++) {
				flag = false;

				String dateStart = "";

				if (userId.equals(result.get(i).getUserId())) {
					flag = false;

					if (result.size() - 1 == i) {
						flag = true;
					}

				} else if (!userId.equals(result.get(i).getUserId())) {
					userId = result.get(i).getUserId();
					flag = true;

				}

				if (flag == true) {

					dateFlag = i;
					String uId = result.get(i - 1).getUserId();

					for (int j = 0; j < clientDetails.size(); j++) {
						if (uId.equals(clientDetails.get(j).getClientId()
								.toString())) {
							formSetId = clientDetails.get(j).getSetForm();
						}
					}

					dateStart = result.get(i - 1).getFormsubmitdate();
					DateFormat dateFormat = new SimpleDateFormat(
							"dd-MM-yyyy hh:mm:ss");
					Calendar cal = Calendar.getInstance();
					String dateStop = dateFormat.format(cal.getTime());
				

					// date differnece
					SimpleDateFormat format = new SimpleDateFormat(
							"dd-MM-yyyy hh:mm:ss");

					Date d1 = null;
					Date d2 = null;

					try {
						d1 = format.parse(dateStart);
						d2 = format.parse(dateStop);

						// in milliseconds
						long diff = d2.getTime() - d1.getTime();
					
						long diffSeconds = diff / 1000 % 60;
						long diffMinutes = diff / (60 * 1000) % 60;
						long diffHours = diff / (60 * 60 * 1000) % 24;
						long diffDays = diff / (24 * 60 * 60 * 1000);

						if (formSetId == 1) {
							if (diffDays >= 1) {
								int setIdFlag = adminService.selectSetId(uId);

								if (setIdFlag == 1) {

									List<ClientListing> clientEmail = adminService
											.getUserEmail(uId);
									
									Map m = (Map) clientEmail.get(0);
									ClientListing clientListing = adminService.getClientListingById(Integer.parseInt(uId));


									if (timeZone.equals("05")) {
										
										mail.sendMessage(
												m.get("emailaddress")
														.toString(),
												"Monitoring System Assignment",
												"Good morning "+clientListing.getUserId()+",\n\n  <p> Today&rsquo;s monitoring Form is ready for you to complete. Just go to <a href='www.calba.net'>www.calba.net</a>, log into your account (with your User name and Password) and in the left hand panel Click 'Monitoring System' and then 'Update'. Try to get into a routine of completing it at roughly the same time each day.</p><p>You can view the updated report on the progression of your condition at any time by clicking on 'Monitoring System' then on 'Report'.\n\nDon&rsquo;t hesitate to contact us if you have any queries about your precautions and practice.</p><br><br>Have a good day!<br><br>Calba Team<br>Email: enquiries@yogatherapy.org"); 
 

  

										adminService
												.updateClientSetFlag(uId, 0);
										}
									}
						

							}

						}else if (formSetId == 2) {
							if (diffDays >= 7) {
								int setIdFlag = adminService.selectSetId(uId);

								if (setIdFlag == 1) {

									List<ClientListing> clientEmail = adminService
											.getUserEmail(uId);
									Map m = (Map) clientEmail.get(0);

									if (timeZone.equals("06")) {

										mail.sendMessage(
												m.get("emailaddress")
														.toString(),
												"Monitoring System Assignment",
												"HI,<br><br>Your assesment has been asign to you, please login into your account and complete your assesment<br><br>Thanks and Regards,<br> Calba Team");

										adminService
												.updateClientSetFlag(uId, 0);
									}
								}

							}

						} else if (formSetId == 3) {
							if (diffDays >= 14) {
								int setIdFlag = adminService.selectSetId(uId);

								if (setIdFlag == 1) {

									List<ClientListing> clientEmail = adminService
											.getUserEmail(uId);
									Map m = (Map) clientEmail.get(0);

									if (timeZone.equals("06")) {

										mail.sendMessage(
												m.get("emailaddress")
														.toString(),
												"Monitoring System Assignment",
												"HI,\n\nYour assesment has been asign to you, please login into your account and complete your assesment\n\nThanks and Regards,\n\n Calba Team");

										adminService
												.updateClientSetFlag(uId, 0);
									}
								}
							}

						}

					} catch (Exception e) {
						e.printStackTrace();
					}

				}

			}

			toolkit.beep();

			new ReminderBeep(5);

		}
	}

	public static void main(String args[]) {

		ReminderBeep rb = new ReminderBeep();
		rb.remindVal(adminService);

	}

	public void remindVal(AdminService adminService) {
		this.adminService = adminService;
		toolkit = Toolkit.getDefaultToolkit();
		timer = new Timer();
		timer.schedule(new RemindTask(), 36000 * 1000);

	}
}
