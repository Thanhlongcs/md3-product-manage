package rikkei.academy.productmanageservlet.controller;

import rikkei.academy.productmanageservlet.model.Product;
import rikkei.academy.productmanageservlet.service.IProductService;
import rikkei.academy.productmanageservlet.service.ProductServiceIMPL;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(value = {"/", "/product"})
public class ProductController extends HttpServlet {
    private IProductService productService = new ProductServiceIMPL();

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                showFormCreate(req, resp);
                break;
            case "edit":
                showFormEdit(req, resp);
                break;
            default:
                showListProduct(req, resp);
                break;
        }
    }


    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String action = req.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create":
                actionCreate(req, resp);
                break;
            case "edit":
                actionEdit(req, resp);
                break;
        }

    }

    private void showListProduct(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        List<Product> productList = productService.findAll();
        req.setAttribute("listProduct", productList);
        RequestDispatcher dispatcher = req.getRequestDispatcher("product/list.jsp");
        dispatcher.forward(req, resp);
    }

    private void showFormCreate(HttpServletRequest req, HttpServletResponse resp) throws
            ServletException, IOException {
        RequestDispatcher dispatcher = req.getRequestDispatcher("product/create.jsp");
        dispatcher.forward(req, resp);
    }

    private void actionCreate(HttpServletRequest req, HttpServletResponse resp) throws
            ServletException, IOException {
        int id = productService.findAll().get(productService.findAll().size() - 1).getId() + 1;
        String name = req.getParameter("name");
        float price = Float.parseFloat(req.getParameter("price"));
        String description = req.getParameter("description");
        String madeIn = req.getParameter("madeIn");
        Product product = new Product(id, name, price, description, madeIn);
        productService.save(product);
        req.setAttribute("message", "create success");
        RequestDispatcher dispatcher = req.getRequestDispatcher("product/create.jsp");
        dispatcher.forward(req, resp);
    }

    private void showFormEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Product product = productService.findById(id);
        req.setAttribute("product", product);
        RequestDispatcher dispatcher = req.getRequestDispatcher("product/edit.jsp");
        dispatcher.forward(req, resp);
    }

    private void actionEdit(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Product product = productService.findById(id);
        String name = req.getParameter("name");
        float price = Float.parseFloat(req.getParameter("price"));
        String description = req.getParameter("description");
        String madeIn = req.getParameter("madeIn");
        product.setName(name);
        product.setPrice(price);
        product.setDescription(description);
        product.setMadeIn(madeIn);
        req.setAttribute("message", "edit success");
        RequestDispatcher dispatcher = req.getRequestDispatcher("product/edit.jsp");
        dispatcher.forward(req, resp);
    }
    private void showFormDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Product product = productService.findById(id);
        req.setAttribute("product", product);
        RequestDispatcher dispatcher = req.getRequestDispatcher("product/delete.jsp");
        dispatcher.forward(req, resp);
    }
    private void deleteAction(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        productService.deleteById(id);
        req.setAttribute("message",productService.findAll());
        RequestDispatcher dispatcher = req.getRequestDispatcher("students/list.jsp");
        dispatcher.forward(req,resp);
    }

}
