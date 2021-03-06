package fr.upond.syndic.security.impl;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.transaction.annotation.Transactional;

import fr.upond.syndic.repository.user.UserDaoImpl;
import fr.upond.syndic.security.ISecurityManager;
import fr.upond.syndic.security.model.UserRole;

/**
 * 
 * @author Lyes Kherbiche
 *
 */
@Transactional
public class SecurityManager implements ISecurityManager {
	
	private static final Log logger = LogFactory.getLog(SecurityManager.class);
	
	@Autowired
	private UserDaoImpl userDao;
    
	public void setUserDao(UserDaoImpl userDao) {
		logger.debug("=== sec ===");
		this.userDao = userDao;
	}
	
	@Override
	@Transactional
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		logger.info("======> sec "+username);
		fr.upond.syndic.security.model.User user = new fr.upond.syndic.security.model.User(username,null,false);
		List<fr.upond.syndic.security.model.User> listUser = userDao.get(user);
		user = listUser.get(0);
		List<GrantedAuthority> authorities = buildUserAuthority(user.getUserRole());
		return buildUserForAuthentication(user, authorities);
	}
	
	
	private User buildUserForAuthentication(fr.upond.syndic.security.model.User user,List<GrantedAuthority> authorities) {
		return new User(user.getUserName(), user.getPassWord(), user.isEnabled(),true, true, true, authorities);
	}

	
	private List<GrantedAuthority> buildUserAuthority(Set<UserRole> userRoles) {
		Set<GrantedAuthority> setAuths = new HashSet<GrantedAuthority>();
		for (UserRole userRole : userRoles) {
			setAuths.add(new SimpleGrantedAuthority(userRole.getRole()));
		}
		List<GrantedAuthority> result = new ArrayList<GrantedAuthority>(
				setAuths);
		return result;
	}

}
