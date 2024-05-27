package com.devpro.javaweb21ExampleDay01.model;

import java.util.Collection;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.JoinTable;
import javax.persistence.ManyToMany;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

@Entity
@Table(name = "tbl_users")
public class User extends BaseEntity implements UserDetails {

	@Column(name = "username", length = 45, nullable = false)
	private String username;
	
	@Column(name = "name", length = 45, nullable = false)
	private String name;
	
	@Column(name="error_code")
	private int errorCode;

	@Column(name = "password", length = 100, nullable = false)
	private String password;

	@Column(name = "email", length = 45, nullable = false)
	private String email;
	
	@Column(name = "phone", length = 100, nullable = true)
	private String phone;
	
	@Column(name = "shipping_address", length = 1000, nullable = true)
	private String shippingAddress;
	
	@ManyToMany(cascade = CascadeType.ALL, fetch = FetchType.EAGER)
	@JoinTable(name = "tbl_users_roles", 
			   joinColumns = @JoinColumn(name = "user_id"), 
			   inverseJoinColumns = @JoinColumn(name = "role_id"))
	private Set<Role> roles = new HashSet<Role>();
	public void addRoles(Role role) {
		role.getUsers().add(this);
		roles.add(role);
	}
	public void deleteRole(Role role) {
		role.getUsers().remove(this);
		roles.remove(role);
	}
	
	@OneToMany(cascade = CascadeType.ALL, 
			   fetch = FetchType.EAGER, 
			   mappedBy = "user")
	private Set<SaleOrder> saleOrders = new HashSet<SaleOrder>();
	public void addSaleOrder(SaleOrder saleOrder) {
		saleOrders.add(saleOrder);
		saleOrder.setUser(this);
	}
	public void deleteSaleOrder(SaleOrder saleOrder) {
		saleOrders.remove(saleOrder);
		saleOrder.setUser(null);
	}
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Set<Role> getRoles() {
		return roles;
	}

	public void setRoles(Set<Role> roles) {
		this.roles = roles;
	}


	public Set<SaleOrder> getSaleOrders() {
		return saleOrders;
	}

	public void setSaleOrders(Set<SaleOrder> saleOrders) {
		this.saleOrders = saleOrders;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String phone) {
		this.phone = phone;
	}
	
	public String getShippingAddress() {
		return shippingAddress;
	}
	
	public void setShippingAddress(String shippingAddress) {
		this.shippingAddress = shippingAddress;
	}
	
	@Override
	public Collection<? extends GrantedAuthority> getAuthorities() {
		return this.roles;
	}
	
	@Override
	public boolean isAccountNonExpired() {
		return true;
	}
	
	@Override
	public boolean isAccountNonLocked() {
		return true;
	}
	
	@Override
	public boolean isCredentialsNonExpired() {
		return true;
	}
	
	@Override
	public boolean isEnabled() {
		return true;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getErrorCode() {
		return errorCode;
	}
	public void setErrorCode(int errorCode) {
		this.errorCode = errorCode;
	}
	
	
	
}
