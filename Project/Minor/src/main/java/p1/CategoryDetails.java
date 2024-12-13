package p1;

public class CategoryDetails {
	    private String categoryName;
	    private String img;
	    private String Speciality;

	    public String getSpeciality() {
			return Speciality;
		}

		public void setSpeciality(String speciality) {
			Speciality = speciality;
		}

		public CategoryDetails() {}

	    public CategoryDetails(String categoryName, String img) {
	        this.categoryName = categoryName;
	        this.img = img;
	    }

	    public String getCategoryName() {
	        return categoryName;
	    }

	    public void setCategoryName(String categoryName) {
	        this.categoryName = categoryName;
	    }

	    public String getImg() {
	        return img;
	    }

	    public void setImg(String img) {
	        this.img = img;
	    }

	}
