package com.poly.Service;

import javax.servlet.ServletContext;

import com.poly.Entity.Accounts;


public interface EmailService {
   void sendMail(ServletContext context,Accounts recipient,String type);
}
