package Servlets;

import Beans.BloodStockLogic;
import DAOs.RequestDAO;
import Entities.Request;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

@WebServlet(urlPatterns = "/RequestServlet")
public class RequestServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getParameter("action").equals("newrequest")) {


            String first_name = request.getParameter("first_name");
            String last_name = request.getParameter("last_name");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");
            Integer quantity = Integer.parseInt(request.getParameter("Quantity"));
            String bloodgroup = request.getParameter("bloodgroup");
            Integer location = Integer.parseInt(request.getParameter("Location"));

            Request req = new Request();
            req.setFirst_Name(first_name);
            req.setLast_Name(last_name);
            req.setEmail(email);
            req.setPhone(phone);
            req.setBloodgroup(bloodgroup);
            req.setAddress(address);
            req.setLocationfk(location);
            req.setQuantity(quantity);
            SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date date = new Date();
            req.setTimestamp(date);
            BloodStockLogic logic = new BloodStockLogic();
            RequestDAO reqdao = new RequestDAO();

            if (logic.verifyBlood(req)) {
                Boolean bol = reqdao.saverequest(req);

                if (bol) {
                    response.sendRedirect("index.jsp?msg=valid");
                }

                }
            else {
                response.sendRedirect("index.jsp?msg=invalid");


            }
        }
        if(request.getParameter("action").equals("accept_cancel")){
            System.out.println(request.getParameter("request_id"));

        }





    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {


    }
}
