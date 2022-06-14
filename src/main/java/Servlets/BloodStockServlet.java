package Servlets;

import Beans.BloodQuantity;
import DAOs.BloodStockDAO;
import Entities.BloodStock;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebFilter;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet(urlPatterns = "/BloodStockServlet")
public class BloodStockServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {



        if(request.getParameter("action").equals("addblood"))
        {
            String blood_group = request.getParameter("blood_group");
            Integer Quantity = Integer.parseInt(request.getParameter("quantity"));
            Integer Location = Integer.parseInt(request.getParameter("Location"));
            Integer donor = Integer.parseInt(request.getParameter("donor"));
            BloodStock b_obj= new BloodStock();

            b_obj.setBloodgroup(blood_group);
            b_obj.setFkdonor(donor);
            b_obj.setQuantity(Quantity);
            b_obj.setFklocation(Location);
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date = new Date();
            b_obj.setTimestamp(formatter.format(date));
            BloodStockDAO bdao= new BloodStockDAO();
            if(bdao.saveBlood(b_obj)){
                RequestDispatcher rd= request.getRequestDispatcher("add-blood.jsp");
                rd.forward(request,response);

            }


        }
        if(request.getParameter("action").equals("viewblood")){
            Integer Location = Integer.parseInt(request.getParameter("Location"));
            BloodStockDAO bdao= new BloodStockDAO();
            List<BloodQuantity> quantities= bdao.getBloods(Location);
            request.setAttribute("BloodQuantities",quantities);
            RequestDispatcher rd= request.getRequestDispatcher("bloods.jsp");
            rd.forward(request,response);


        }


    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
