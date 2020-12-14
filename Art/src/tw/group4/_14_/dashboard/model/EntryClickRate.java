package tw.group4._14_.dashboard.model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table (name = "ENTRYCLICKRATE")
public class EntryClickRate {
	
	@Id @Column(name = "ECRNO")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int  ECRNo;
	
	@Column(name = "TICKET")
	private int  ticket;
	
	@Column(name = "SHOP")
	private int  shop;
	
	@Column(name = "RESTAURANT")
	private int  restaurant;
	
	@Column(name = "MAP")
	private int  map;
	
	@Column(name = "NEARBY")
	private int  nearby;
	
	@Column(name = "COURSE")
	private int  course;
	
	@Column(name = "ARTIST")
	private int  artist;
	

	public EntryClickRate() {
	}

	public EntryClickRate(int eCRNo, int ticket, int shop, int restaurant, int map, int nearby, int course,
			int artist) {
		ECRNo = eCRNo;
		this.ticket = ticket;
		this.shop = shop;
		this.restaurant = restaurant;
		this.map = map;
		this.nearby = nearby;
		this.course = course;
		this.artist = artist;
	}

	public int getECRNo() {
		return ECRNo;
	}

	public void setECRNo(int eCRNo) {
		ECRNo = eCRNo;
	}

	public int getTicket() {
		return ticket;
	}

	public void setTicket(int ticket) {
		this.ticket = ticket;
	}

	public int getShop() {
		return shop;
	}

	public void setShop(int shop) {
		this.shop = shop;
	}

	public int getRestaurant() {
		return restaurant;
	}

	public void setRestaurant(int restaurant) {
		this.restaurant = restaurant;
	}

	public int getMap() {
		return map;
	}

	public void setMap(int map) {
		this.map = map;
	}

	public int getNearby() {
		return nearby;
	}

	public void setNearby(int nearby) {
		this.nearby = nearby;
	}

	public int getCourse() {
		return course;
	}

	public void setCourse(int course) {
		this.course = course;
	}

	public int getArtist() {
		return artist;
	}

	public void setArtist(int artist) {
		this.artist = artist;
	}
	
	
	
	
}
