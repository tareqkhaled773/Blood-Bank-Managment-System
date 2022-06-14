package Servlets;

import DAOs.BloodStockDAO;
import DAOs.DonorDAO;
import Entities.Donor;

import org.apache.commons.io.IOUtils;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

@WebServlet(urlPatterns = "/DonorServlet")
@MultipartConfig(maxFileSize = 16177215)
public class DonorServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action.equals("savedonor")){
            String firstname = request.getParameter("first_name");
            String lastname = request.getParameter("last_name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone_number");
            String bloodtype = request.getParameter("blood_group");
            Part picture = request.getPart("donor_picture");
            InputStream inputStream = null;
            inputStream = picture.getInputStream();

            /*byte[] bytes = new byte[16177215];
            inputStream.read(bytes);*/


            Donor don = new Donor();
            don.setBloodtype(bloodtype);
            don.setEmail(email);
            don.setFirstname(firstname);
            don.setLastname(lastname);
            don.setPhone(phone);
            don.setPicture(IOUtils.toByteArray(inputStream));

            DonorDAO d = new DonorDAO();
            if(d.saveDonor(don)){
                System.out.println("Donor Saved");
                RequestDispatcher rd= request.getRequestDispatcher("add-donor.jsp");
                rd.forward(request,response);
            }


        }

    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
