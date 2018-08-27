/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.mycompany.bus_management.dao;

import com.mycompany.bus_management.domain.BusInfo;
import com.mycompany.bus_management.domain.Passenger;
import com.mycompany.bus_management.domain.Payment;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.orm.hibernate4.HibernateTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

/**
 *
 * @author Naznin34
 */
@Transactional
@Repository
public class PaymentDAO implements IPaymentDAO {

    @Autowired
    private HibernateTemplate hibernateTemplate;

    @SuppressWarnings("unchecked")
    @Override
    public List<Payment> getAllPayment() {
        String hql = "FROM Payment p LEFT JOIN FETCH  p.passenger ORDER BY p.payId";
        return (List<Payment>) hibernateTemplate.find(hql);
    }

    @Override
    public Payment getPaymentById(int payId) {
        return hibernateTemplate.get(Payment.class, payId);
    }

    @Override
    public void addPayment(Payment payment) {
        Payment pa = new Payment();
        double tickePrice = payment.getPriceOfTicket();
        Integer tickN = payment.getNumberOfTicket();
       
            pa.setPassenger(payment.getPassenger());
            pa.setPayDate(payment.getPayDate());
            pa.setPriceOfTicket(tickePrice);
            pa.setNumberOfTicket(tickN);
            pa.setTotalFair(tickePrice * tickN);
            pa.setTranscationId(payment.getTranscationId());
            hibernateTemplate.save(pa);
       
    }

    @Override
    public void updatePayment(Payment payment) {
        double totalFair = payment.getPriceOfTicket() * payment.getNumberOfTicket();
        Payment pa = getPaymentById(payment.getPayId());
        pa.setPassenger(payment.getPassenger());
        pa.setPayDate(payment.getPayDate());
        pa.setPriceOfTicket(payment.getPriceOfTicket());
        pa.setNumberOfTicket(payment.getNumberOfTicket());
        pa.setTotalFair(totalFair);
        pa.setTranscationId(payment.getTranscationId());

        hibernateTemplate.update(pa);
    }

    @Override
    public void deletePayment(int payId) {
        hibernateTemplate.delete(getPaymentById(payId));
    }

    @Override
    public boolean PaymentExists(int passengerid, int numberofticket) {
        String hql = "FROM Payment as p WHERE p.passenger.passId = ? and p.numberOfTicket=?";
        List<Payment> list = (List<Payment>) hibernateTemplate.find(hql, passengerid, numberofticket);
        return list.size() > 0 ? true : false;
    }

}
