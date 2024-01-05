package Blog;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Database.DAOFactory;

public class BlogDaoImpl implements BlogDAO {
	private DAOFactory daoFactory;

    public BlogDaoImpl( DAOFactory daoFactory ) {
        this.daoFactory = daoFactory;
    }
    
    private static BlogBean getBean(ResultSet res) throws SQLException {
    	BlogBean bean = new BlogBean();
    	
    	bean.setID(res.getInt("id"));
    	bean.setUserID(res.getInt("user_id"));
    	bean.setTitle(res.getString("title"));
    	bean.setDescription(res.getString("description"));
    	bean.setImage(res.getString("image"));
    	bean.setDate(res.getDate("date"));
    	bean.setUserName(res.getString("user_name"));
    	
    	return bean;
    }
    
    @Override
    public void create(int user_id, String title, String description, String image) throws SQLException {
    	Connection conn = daoFactory.getConnection();
		String SQL = "INSERT INTO blogs (user_id, title, description, image) VALUES(?, ?, ?, ?);";
		PreparedStatement statement = conn.prepareStatement(SQL);
    	
		statement.setInt(1, user_id);
		statement.setString(2, title);
		statement.setString(3, description);
		statement.setString(4, image);
		
		
		statement.execute();
		
		statement.close();
		conn.close();
    }
    
    @Override
    public void delete(int blog_id) throws SQLException {
    	Connection conn = daoFactory.getConnection();
    	String SQL = "DELETE FROM blogs WHERE id = ?;";
    	PreparedStatement statement = conn.prepareStatement(SQL);
    	
    	statement.setInt(1, blog_id);
    	
    	statement.execute();
    	
    	statement.close();
    	conn.close();
    }
    
    @Override
    public void update(BlogBean bean) throws SQLException {
    	Connection conn = daoFactory.getConnection();
    	String SQL = "UPDATE blogs SET title = ?, description = ?, image = ? WHERE id = ?;";
    	PreparedStatement statement = conn.prepareStatement(SQL);
    	
    	statement.setString(1, bean.getTitle());
    	statement.setString(2, bean.getDescription());
    	statement.setString(3, bean.getImage());
    	statement.setInt(4, bean.getID());
    	
    	statement.execute();
    	
    	statement.close();
    	conn.close();
    }
    
    @Override
    public ArrayList<BlogBean> all() throws SQLException {
    	Connection conn = daoFactory.getConnection();
    	String SQL = "SELECT blogs.*, users.name AS user_name "
    			+ "FROM blogs "
    			+ "JOIN users ON blogs.user_id = users.id "
    			+ "ORDER BY id DESC;";
    	PreparedStatement statement = conn.prepareStatement(SQL);
    	
    	ResultSet res = statement.executeQuery();
    	ArrayList<BlogBean> list = new ArrayList<BlogBean>();
    	
    	while(res.next()) list.add(getBean(res));
    	
    	res.close();
    	statement.close();
    	conn.close();
    	
    	return list;
    }
    
    @Override
    public BlogBean one(int blog_id) throws SQLException {
    	Connection conn = daoFactory.getConnection();
    	String SQL = "SELECT blogs.*, users.name AS user_name "
    			+ "FROM blogs "
    			+ "JOIN users ON blogs.user_id = users.id "
    			+ "WHERE blogs.id = ?;";
    	PreparedStatement statement = conn.prepareStatement(SQL);
    	
    	statement.setInt(1, blog_id);
    	
    	ResultSet res = statement.executeQuery();
    	BlogBean bean = res.next() ? getBean(res) : null;
    	    	
    	res.close();
    	statement.close();
    	conn.close();
    	
    	return bean;
    }
}
