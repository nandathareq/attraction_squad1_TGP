package id.agile.attractionreservation.entity;

import java.io.Serializable;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.fasterxml.jackson.annotation.JsonIgnore;

@Entity
@Table(name = "attraction_review")
public class AttractionReview implements Serializable{

	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name="attraction_review_id")
	private int id;
	
	@Column(name="review")
	private String review;
	
	@Column(name="place_rating")
	private int placeRating;
	
	@Column(name="created_at")
	private String createdAt;
	
	@Column(name="updated_at")
	private String updatedAt;
	
	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "user_id", nullable = false)
	private User user;


	@ManyToOne(fetch = FetchType.LAZY, optional = false)
	@JoinColumn(name = "place_id", nullable = false)
	private AttractionPlace attractionPlace;

	

	public AttractionReview() {

	}



	public AttractionReview(String review, int placeRating, String createdAt, String updatedAt, User user,
			AttractionPlace attractionPlace) {
		super();
		this.review = review;
		this.placeRating = placeRating;
		this.createdAt = createdAt;
		this.updatedAt = updatedAt;
		this.user = user;
		this.attractionPlace = attractionPlace;
	}



	public int getId() {
		return id;
	}



	public void setId(int id) {
		this.id = id;
	}



	public String getReview() {
		return review;
	}



	public void setReview(String review) {
		this.review = review;
	}



	public int getPlaceRating() {
		return placeRating;
	}



	public void setPlaceRating(int placeRating) {
		this.placeRating = placeRating;
	}



	public String getCreatedAt() {
		return createdAt;
	}



	public void setCreatedAt(String createdAt) {
		this.createdAt = createdAt;
	}



	public String getUpdatedAt() {
		return updatedAt;
	}



	public void setUpdatedAt(String updatedAt) {
		this.updatedAt = updatedAt;
	}



	public User getUser() {
		return user;
	}



	public void setUser(User user) {
		this.user = user;
	}



	public AttractionPlace getAttractionPlace() {
		return attractionPlace;
	}



	public void setAttractionPlace(AttractionPlace attractionPlace) {
		this.attractionPlace = attractionPlace;
	}
	
	

	
	
	
	
	
}



