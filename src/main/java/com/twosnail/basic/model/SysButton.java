package com.twosnail.basic.model;

import javax.servlet.http.HttpServletRequest;

import com.jfinal.plugin.activerecord.Db;
import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.plugin.activerecord.Record;
import com.twosnail.basic.util.RequestHandler;
import com.twosnail.basic.util.exception.BusiException;

/**   
 * @Title: SysButton.java
 * @Description: TODO 
 * @author 两只蜗牛   
 * @date 2015年4月17日 下午1:02:01 
 * @version V1.0   
 */

@SuppressWarnings("serial")
public class SysButton extends Model<SysButton>{
	
	public static final SysButton me = new SysButton() ; 
	public static final int STATUS_NOMAL = 1;    
	public static final int STATUS_FREEZE = 0;
	
	
	/**
	 * 获取功能按钮信息
	 * @param menuId
	 * @param pageNumber
	 * @param pageSize
	 * @return
	 */
	public Page<Record> getButton( int menuId , int pageNumber, int pageSize) {
		return Db.paginate(pageNumber, pageSize, 
				"SELECT a.* " , "FROM sys_button a WHERE menuId=? " , menuId );
			
	}

	/**
	 * 判断功能按钮名是否存在
	 * @param userName
	 * @return  true-->存在
	 */
	public boolean checkButtonName(String userName){
		return me.findFirst( "SELECT id,userName FROM sys_user WHERE userName=?" , userName) != null ;
	}
	
	/**
	 * 检查功能按钮名的个数
	 * @param userName
	 */
	public int checkButtonNameCount( String userName ){
		return Db.queryInt("SELECT COUNT(1) FROM sys_user a WHERE a.userName = ?" , userName );
	}
	
	/**
     * 查看该角色下是否存在功能按钮
     * @param id
     * @return true 不存在
     * @throws BusiException
     */
    public boolean checkButtonById( int id ){
    	return Db.queryColumn("SELECT id FROM sys_user a WHERE a.roleId = ?" , id ) == null;
    }
    
	
	/**
	 * 添加功能按钮信息
	 * @param sysButton
	 * @throws BusiException
	 */
	public void addButton( SysButton sysButton , HttpServletRequest request ) throws BusiException{
		if( !sysButton.save() ) {
            throw new BusiException( "添加信息失败!" );
        }
	}
	
	/**
	 * 通过id查询功能按钮信息
	 * @param id
	 * @return
	 */
	public SysButton getButtonById( long id){
		return me.findById(id) ;
	}
	
	/**
	 * 修改功能按钮信息
	 * @param user
	 * @param request
	 * @throws BusiException
	 */
	public void updButton( 
			SysButton user , HttpServletRequest request ) throws BusiException{
		if( !user.update() ) {
            throw new BusiException( "添加信息失败!" );
        }
	}
	
	
    
    /**
     * 删除功能按钮
     * @param id
     * @throws BusiException
     */
    public void delButtonTx( String[] ids ) throws BusiException{
		for (String id : ids) {
			if( !me.deleteById( id ) ) {
	            throw new BusiException( "删除功能按钮失败!" );
	        }
		}
    }
    
}