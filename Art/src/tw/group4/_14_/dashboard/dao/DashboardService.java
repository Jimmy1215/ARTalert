package tw.group4._14_.dashboard.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service("DashboardService")
public class DashboardService {

	@Autowired
	private DashboardDAOImpl dDao;
	
	public DashboardService() {
		
	}
	
	public DashboardService(DashboardDAOImpl dDao) {
		this.dDao = dDao;
	}
	
	
	public Long sumTicketTotal() {
		return dDao.sumTicketTotal();
	}
	
	public Long sumMember() {
		return dDao.sumMember();
	}
}
