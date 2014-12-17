package net.calba.backpain.service;

import java.util.List;

import net.calba.backpain.exception.CalbaAppServiceException;
import net.calba.backpain.exception.RecordNotFoundException;
import net.calba.backpain.model.CategoryList;
import net.calba.backpain.model.Client;
import net.calba.backpain.model.ClientDetail;

public interface ClientService {
	
	/**
	 * Authenticate user with given parameters.
	 * @param userId String
	 * @param password String
	 * @return Users
	 * @throws CalbaAppServiceException 
	 */
	Client authenticate(String userId, String password) throws CalbaAppServiceException;
	
	/**
	 * 
	 * @param password String
	 * @param newPassword String
	 * @param clientId Integer
	 * @return Client
	 * @throws CalbaAppServiceException
	 */
	Client updateClientPassword(String password, String newPassword, Integer clientId)
			throws CalbaAppServiceException;
	
	
	/**
	 * Get client detail
	 * @param client Client
	 * @return ClientDetail
	 */
	ClientDetail getClientDetail(Client client);
	
	/**
	 * update client details.
	 * @param clientDetail ClientDetail
	 */
	void updateClientDetail(ClientDetail clientDetail);
	
	/**
	 * 
	 * @param clientDetail
	 * @return Client
	 * @throws CalbaAppServiceException 
	 */
	Client addClientDetail(ClientDetail clientDetail) throws CalbaAppServiceException;
	
	/**
	 * client password recovery using provided email.
	 * @param email String
	 * @throws CalbaAppServiceException
	 */
	void passwordRecovery(String email) throws CalbaAppServiceException;
	
	
	/**
	 * Get Client by given Id.
	 * @param clientId value 
	 * @return Client
	 * @throws RecordNotFoundException
	 */
	Client getClientById(Integer clientId) throws RecordNotFoundException;

	List<CategoryList> getCategoryList();
	
	
	
	

}
