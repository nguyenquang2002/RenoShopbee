package com.devpro.javaweb21ExampleDay01.services;

import java.io.IOException;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.devpro.javaweb21ExampleDay01.dto.UserSearchModel;
import com.devpro.javaweb21ExampleDay01.model.Role;
import com.devpro.javaweb21ExampleDay01.model.User;


@Service
public class UserService extends BaseService<User> {
	@Autowired
	RoleService roleService = new RoleService();
	
	@Override
	protected Class<User> clazz() {
		return User.class;
	}

	public User loadUserByUsername(String userName) {
		String sql = "select * from tbl_users u where u.username = '" + userName + "' and status = 1";
		return this.getEntityByNativeSQL(sql);
	}
	
	@Transactional
	public User add(User u)
			throws IllegalStateException, IOException {
		
//		List<User> users = super.findAll();
//		for (User user : users) {
//			
//		}
		u.setPassword(new BCryptPasswordEncoder(4).encode(u.getPassword()));
		Role role = roleService.getById(18);
		u.addRoles(role);
		return super.saveOrUpdate(u);
	}
	
	@Transactional
	public User update(User u)
			throws IllegalStateException, IOException {
		User user = super.getById(u.getId());
//		List<User> users = super.findAll();
//		for (User user : users) {
//			
//		}
//		String pass= new BCryptPasswordEncoder(4).encode(u.getPassword()); 
//		if(user.getPassword()==pass) {
			return super.saveOrUpdate(u);
//		} else {
//			u.setPassword(pass);
//			return super.saveOrUpdate(u);
//		}
		
	}
	
	
	public PagerData<User> search(UserSearchModel searchModel) {
		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_users as u";

		if (searchModel != null) {
			
			// tìm kiếm theo role
			if(searchModel.getRoleId() != null && searchModel.getRoleId()>0) {
				sql += " inner join tbl_users_roles as ur on u.id = ur.user_id where 1=1 and ur.role_id= " + searchModel.getRoleId();
			} else sql+= " WHERE 1=1";
		
			// tìm theo seo
//					if (!StringUtils.isEmpty(searchModel.seo)) {
//						sql += " and p.seo = '" + searchModel.seo + "'";
//					}

			// tìm kiếm sản phẩm hot
//					if (searchModel.isHot != null) {
//						sql += " and p.is_hot = '" + searchModel.seo + "'";
//					}
			
			// tìm kiếm theo title và description
			if (!StringUtils.isEmpty(searchModel.getKeyword())) {
				sql += " and (u.name like '%" + searchModel.getKeyword() + "%'" + 
							" or u.address like '%" + searchModel.getKeyword() + "%'" +
							" or u.username like '%" + searchModel.getKeyword() + "%'" +
							" or u.email like '%" + searchModel.getKeyword() + "%'" +
						     " or o.phone like '%" + searchModel.getKeyword() + "%')";
			}
		}
		
		// chi lay san pham chua xoa
//						sql += " and p.status=1 ";
		
		return getEntitiesByNativeSQL(sql, searchModel.getPage());
	}
}
