package com.devpro.javaweb21ExampleDay01.services;

import java.io.File;
import java.io.IOException;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;

import com.devpro.javaweb21ExampleDay01.dto.ProductSearchModel;
import com.devpro.javaweb21ExampleDay01.model.Product;
import com.devpro.javaweb21ExampleDay01.model.ProductImages;

@Service
public class ProductsService extends BaseService<Product>{

	@Autowired
	private ProductsImagesService productImagesService;
	
	@Override
	protected Class<Product> clazz() {
		// TODO Auto-generated method stub
		return Product.class;
	}
	
	/**
	 * dùng để kiểm tra xem admin có upload ảnh product hay không
	 * @param images
	 * @return
	 */
	private boolean isEmptyUploadFile(MultipartFile[] images) {
		if (images == null || images.length <= 0)
			return true;

		if (images.length == 1 && images[0].getOriginalFilename().isEmpty())
			return true;

		return false;
	}
	
	/**
	 * dùng để kiểm tra xem admin có upload ảnh product hay không
	 * @param image
	 * @return
	 */
	private boolean isEmptyUploadFile(MultipartFile image) {
		return image == null || image.getOriginalFilename().isEmpty();
	}
	
	private String getUniqueUploadFileName(String fileName) {
		String[] splitFileName = fileName.split("\\.");
		return splitFileName[0] + System.currentTimeMillis() + "." + splitFileName[1];
	}
	
	
	@Transactional
	public Product add(Product p, MultipartFile productAvatar, MultipartFile[] productPictures)
			throws IllegalStateException, IOException {

		// kiểm tra xem admin có đẩy avatar lên không ???
		if (!isEmptyUploadFile(productAvatar)) { // có đẩy avatar lên.
			
			String fileName = getUniqueUploadFileName(productAvatar.getOriginalFilename());
			
			// tạo đường dẫn tới folder chứa avatar
			String pathToAvatar = "D:/upload/product/avatar/" + fileName;

			// lưu avatar vào đường dẫn trên
			productAvatar.transferTo(new File(pathToAvatar));

			p.setAvatar("product/avatar/" + fileName);
		}

		// có đẩy pictures(product_images) ???
		if (!isEmptyUploadFile(productPictures)) { // có đẩy pictures lên.

			// nếu admin đẩy lên thì duyệt tất cả file đẩy lên và lưu trên server
			for (MultipartFile pic : productPictures) {
				String fileName = getUniqueUploadFileName(pic.getOriginalFilename());
				
				// lưu ảnh admin đẩy lên vào server
				pic.transferTo(new File("D:/upload/product/pictures/" + fileName));

				// tạo mới 1 bản ghi product_images
				ProductImages pi = new ProductImages();
				pi.setPath("product/pictures/" + fileName);
				pi.setTitle(fileName);
				
				p.addProductImages(pi);
			}
		}

		// tạo seo: bổ sung thêm thời gian tính bằng miliseconds để tránh trùng seo
//		p.setSeo(new Slugify().slugify(p.getTitle() + "-" + System.currentTimeMillis()));
		
		// lưu vào database
		return super.saveOrUpdate(p);
	}
	
	@Transactional
	public Product update(Product p, MultipartFile productAvatar, MultipartFile[] productPictures)
			throws IllegalStateException, IOException {

		// lấy thông tin cũ của product theo id
		Product productInDb = super.getById(p.getId());

		// có đẩy avartar ??? => xóa avatar cũ đi và thêm avatar mới
		if (!isEmptyUploadFile(productAvatar)) {
			// xóa avatar trong folder lên
			new File("D:/upload/" + productInDb.getAvatar()).delete();

			// update avatar mới
			String fileName = getUniqueUploadFileName(productAvatar.getOriginalFilename());
			productAvatar.transferTo(new File("D:/upload/product/avatar/" + fileName));
			p.setAvatar("product/avatar/" + fileName);
		} 
		else {
			// sử dụng lại avartar cũ
			p.setAvatar(productInDb.getAvatar());
		}

		// có đẩy pictures ???
		if (!isEmptyUploadFile(productPictures)) {

			// xóa pictures cũ
			if (productInDb.getProductImages() != null && productInDb.getProductImages().size() > 0) {
				for (ProductImages opi : productInDb.getProductImages()) {
					// xóa avatar trong folder lên
					new File("D:/upload/" + opi.getPath()).delete();

					// xóa dữ liệu trong database
					productImagesService.delete(opi);
				}
			}

			// update pictures mới
			for (MultipartFile pic : productPictures) {
				String fileName = getUniqueUploadFileName(pic.getOriginalFilename());
				
				pic.transferTo(new File("D:/upload/product/pictures/" + fileName));
				
				ProductImages pi = new ProductImages();
				pi.setPath("product/pictures/" + fileName);
				pi.setTitle(fileName);
				
				p.addProductImages(pi);
			}
		}

		//tạo seo
		//p.setSeo(new Slugify().slugify(p.getTitle() + "-" + System.currentTimeMillis()));
		
		// lưu vào database
		return super.saveOrUpdate(p);
	}
	
	public PagerData<Product> search(ProductSearchModel searchModel) {
		// khởi tạo câu lệnh
		String sql = "SELECT * FROM tbl_products p WHERE 1=1";

		if (searchModel != null) {
			
			// tìm kiếm theo category
			if(searchModel.getCategoryId() != null && searchModel.getCategoryId() > 0) {
				sql += " and category_id = " + searchModel.getCategoryId();
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
				sql += " and (p.name like '%" + searchModel.getKeyword() + "%'" + 
							" or p.id like '%" + searchModel.getKeyword() + "%'" +
						     " or p.description like '%" + searchModel.getKeyword() + "%')";
			}
			
			if(!StringUtils.isEmpty(searchModel.getPrice())) {
				sql += " and p.price between " + searchModel.getPrice();
			}
			
			if(!StringUtils.isEmpty(searchModel.getSize())) {
				sql += " and p.size like '" + searchModel.getSize() +"' ";
			}
			
			if(!StringUtils.isEmpty(searchModel.getColor())) {
				sql += " and p.color like '" + searchModel.getColor() +"' ";
			}
		}
		
		
		// chi lay san pham chua xoa
//						sql += " and p.status=1 ";
		
		return getEntitiesByNativeSQL(sql, searchModel.getPage());
	}
}
