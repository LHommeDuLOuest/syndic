package fr.upond.syndic.service.user;

import java.util.List;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;

import fr.upond.syndic.repository.IDao;
import fr.upond.syndic.security.model.User;
import fr.upond.syndic.service.IManager;

/**
 * 
 * @author LYES KHERBICHE
 *
 */
@Transactional
public class UserManager implements IManager<User> {
	
	private static final Log logger = LogFactory.getLog(UserManager.class);
	@Autowired
	private IDao<User> userDao;
	
	public void setUserDao(IDao<User> userDao) {
		this.userDao = userDao;
	}

	@Override
	public List<User> get(User user) {
		logger.info("===== IN UserManager get =====");
		//this.userDao.delete(user);
		return this.userDao.get(user);
	}

}
