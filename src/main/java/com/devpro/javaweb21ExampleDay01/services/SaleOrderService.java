package com.devpro.javaweb21ExampleDay01.services;

import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.devpro.javaweb21ExampleDay01.dto.OrderSearchModel;
import com.devpro.javaweb21ExampleDay01.model.SaleOrder;

@Service
public class SaleOrderService extends BaseService<SaleOrder> {

	@Override
	protected Class<SaleOrder> clazz() {
		return SaleOrder.class;
	}
	
	public PagerData<SaleOrder> search(OrderSearchModel searchModel) {
		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_saleorder o WHERE 1=1";

		if (searchModel != null) {
			
			// tìm kiếm theo category
			if(searchModel.getOrderStatus() != null && searchModel.getOrderStatus()>-1) {
				sql += " and order_status = " + searchModel.getOrderStatus();
			}
		
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
				sql += " and (o.code like '%" + searchModel.getKeyword() + "%'" + 
							" or o.user_id like '%" + searchModel.getKeyword() + "%'" +
							" or o.customer_phone like '%" + searchModel.getKeyword() + "%'" +
							" or o.customer_address like '%" + searchModel.getKeyword() + "%'" +
						     " or o.customer_name like '%" + searchModel.getKeyword() + "%')";
			}
		}
		
			sql+=" order by id desc";
		// chi lay san pham chua xoa
//						sql += " and p.status=1 ";
		
		return getEntitiesByNativeSQL(sql, searchModel.getPage());
	}

}
