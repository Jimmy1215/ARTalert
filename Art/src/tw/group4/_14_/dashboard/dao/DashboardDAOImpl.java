package tw.group4._14_.dashboard.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

@Repository("DashboardDAOImpl")
public class DashboardDAOImpl {
	
	private SessionFactory sessionFactory;
	
	@Autowired
	public DashboardDAOImpl(@Qualifier("sessionFactory") SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	//查詢活動售票總金額
	public Long sumTicketTotal() {
		Session session = sessionFactory.getCurrentSession();
		String sql = "SELECT SUM(ol.TOTALPRICE) From Orderlist ol";
		Query createQuery = session.createQuery(sql);
		Long totaLong = (Long)createQuery.uniqueResult();
		return totaLong;
	}
	
	//查詢註冊會員總人數
	public Long sumMember() {
		Session session = sessionFactory.getCurrentSession();
		String sql = "SELECT COUNT(1) FROM WebsiteMember";
		Query createQuery = session.createQuery(sql);
		Long count = (Long)createQuery.uniqueResult();
		return count;
	}
}
