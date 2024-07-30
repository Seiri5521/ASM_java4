package com.poly.Entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedStoredProcedureQueries;
import javax.persistence.NamedStoredProcedureQuery;
import javax.persistence.StoredProcedureParameter;
import javax.persistence.Table;

import com.poly.Constant.NamedStored;

@NamedStoredProcedureQueries({
    @NamedStoredProcedureQuery(
        name = NamedStored.FIND_ACCOUNTS_BY_ID,
        procedureName = "sp_selectUsersLikedVideoByHref",
        resultClasses = {Accounts.class},
        parameters = @StoredProcedureParameter(name = "videoHref", type = String.class)
    )
})
@Entity
@Table(name = "Accounts")
public class Accounts {
    
    @Id
    @Column(name = "Username", length = 500)
    private String username;
    
    @Column(name = "Password", length = 50)
    private String password;
    
    @Column(name = "Fullname", length = 500)
    private String fullname;
    
    @Column(name = "Email", length = 50)
    private String email;
    
    @Column(name = "Photo", length = 50)
    private String photo;
    
    @Column(name = "Activated")
    private Boolean activated;
    
    @Column(name = "Admin")
    private Boolean admin;

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

    public String getFullname() {
        return fullname;
    }

    public void setFullname(String fullname) {
        this.fullname = fullname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public Boolean getActivated() {
        return activated;
    }

    public void setActivated(Boolean activated) {
        this.activated = activated;
    }

    public Boolean getAdmin() {
        return admin;
    }

    public void setAdmin(Boolean admin) {
        this.admin = admin;
    }
}
