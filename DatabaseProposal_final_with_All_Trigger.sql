use mydb;

/* Maintanance Table */
INSERT INTO maintainancecertificate (CertificateId,CertificateStatus) values (1,'Valid');
INSERT INTO maintainancecertificate (CertificateId,CertificateStatus) values (0,'Invalid');
SELECT * FROM maintainancecertificate;
/*--------------------------------*/

/*AirLiner Tables */
INSERT INTO airliner (AirlinerId, AirlinerName,AirlinerType) 
VALUES (747,'Emirates','Wide-Body'); 
INSERT INTO airliner (AirlinerId, AirlinerName,AirlinerType) 
VALUES (321,'KLM','Narrow-Body'); 
INSERT INTO airliner (AirlinerId, AirlinerName,AirlinerType) 
VALUES (170,'Luftsanza','Wide-Body'); 
INSERT INTO airliner (AirlinerId, AirlinerName,AirlinerType) 
VALUES (273,'AirIndia','Wide-Body'); 
INSERT INTO airliner (AirlinerId, AirlinerName,AirlinerType) 
VALUES (786,'AirFrance','Large - Body'); 

SELECT * FROM airliner;
/*--------------------------------*/

/*Flight Table*/

INSERT INTO flight (flight.FlightID, flight.Destination,flight.Source,flight.DepartureTime,flight.ArrivalTime,flight.CertificateId,flight.AirlinerId,flight.TotalSeatCapacity,flight.Price,flight.TotalSeatBooked) 
VALUES ('KL-360','London','Newark','2017-12-28 10:40:00' ,'2017-12-28 18:23:00' ,1,321,100,800,30);

INSERT INTO flight (flight.FlightID, flight.Destination,flight.Source,flight.DepartureTime,flight.ArrivalTime,flight.CertificateId,flight.AirlinerId,flight.TotalSeatCapacity,flight.Price,flight.TotalSeatBooked) 
VALUES ('KL-712','Memphis','Boston','2017-12-20 06:40:00' ,'2017-12-20 11:45:00' ,1,321,75,448,75);

INSERT INTO flight (flight.FlightID, flight.Destination,flight.Source,flight.DepartureTime,flight.ArrivalTime,flight.CertificateId,flight.AirlinerId,flight.TotalSeatCapacity,flight.Price,flight.TotalSeatBooked) 
VALUES ('EM-549','Frankfurt','Boston','2017-12-18 09:40:00' ,'2017-12-19 12:23:00' ,1,747,50,546,32);

INSERT INTO flight (flight.FlightID, flight.Destination,flight.Source,flight.DepartureTime,flight.ArrivalTime,flight.CertificateId,flight.AirlinerId,flight.TotalSeatCapacity,flight.Price,flight.TotalSeatBooked) 
VALUES ('EM-360','London','Newark','2017-12-08 08:40:00' ,'2017-12-09 18:23:00' ,1,747,75,400,30);

INSERT INTO flight (flight.FlightID, flight.Destination,flight.Source,flight.DepartureTime,flight.ArrivalTime,flight.CertificateId,flight.AirlinerId,flight.TotalSeatCapacity,flight.Price,flight.TotalSeatBooked) 
VALUES ('KL-713','London','Newark','2017-12-18 18:40:00' ,'2017-12-19 18:23:00' ,1,321,65,400,30);



INSERT INTO flight (flight.FlightID, flight.Destination,flight.Source,flight.DepartureTime,flight.ArrivalTime,flight.CertificateId,flight.AirlinerId,flight.TotalSeatCapacity,flight.Price,flight.TotalSeatBooked) 
VALUES ('AF-360','Boston','Dallas','2017-12-24 21:40:00' ,'2017-12-25 1:23:00' ,1,786,44,476,33);

INSERT INTO flight (flight.FlightID, flight.Destination,flight.Source,flight.DepartureTime,flight.ArrivalTime,flight.CertificateId,flight.AirlinerId,flight.TotalSeatCapacity,flight.Price,flight.TotalSeatBooked) 
VALUES ('AI-456','Surat','Chicago','2018-01-07 21:40:00' ,'2018-01-08 1:23:00' ,0,273,55,523,0);

SELECT * FROM flight;
/*--------------------------------*/
/* Card-Type Table */
INSERT INTO creditcard(creditcard.CardID,creditcard.CardType) values (3001,'Master');
INSERT INTO creditcard(creditcard.CardID,creditcard.CardType) values (3002,'Visa');
INSERT INTO creditcard(creditcard.CardID,creditcard.CardType) values (3003,'Mastro');

SELECT * from creditcard;

/*--------------------------------*/
/* Address Table Table */

INSERT INTO address(address.AddressID,address.City,address.Country,address.State,address.Zipcode) values (1004,'Boston','USA','MA',02115);
INSERT INTO address(address.AddressID,address.City,address.Country,address.State,address.Zipcode) values (1005,'California','USA','CA',0415);
INSERT INTO address(address.AddressID,address.City,address.Country,address.State,address.Zipcode) values (1006,'Memphis','USA','TN',02515);
INSERT INTO address(address.AddressID,address.City,address.Country,address.State,address.Zipcode) values (1007,'Texas','USA','TX',02315);

SELECT * FROM address;


/*--------------------------------*/

/* Customer Table Table */




INSERT INTO customer(customer.CustomerId,customer.FirstName,customer.LastName,customer.Mobileno,customer.EmailId,customer.AddressID,customer.CreditCard_CardID) values (2142,'Siddhesh','Kuvelar',984445565,'kuvelar.s@gmai.com',1004,3001);

INSERT INTO customer(customer.CustomerId,customer.FirstName,customer.LastName,customer.Mobileno,customer.EmailId,customer.AddressID,customer.CreditCard_CardID) values (2147,'Ritesh','Patil',984445566,'patil.ri@gmai.com',1005,3002);

INSERT INTO customer(customer.CustomerId,customer.FirstName,customer.LastName,customer.Mobileno,customer.EmailId,customer.AddressID,customer.CreditCard_CardID) values (2198,'Aashta','Dinchakicha',984445567,'shah.s@gmai.com',1006,3003);

INSERT INTO customer(customer.CustomerId,customer.FirstName,customer.LastName,customer.Mobileno,customer.EmailId,customer.AddressID,customer.CreditCard_CardID) values (2149,'Apurva','kushare',984445568,'apurva.s@gmai.com',1007,3002);

SELECT * from customer;

/*--------------------------------*/
/* Ticket Type*/

INSERT INTO tickettype(tickettype.TicketTypeID ,tickettype.TicketTypeName) values (10,'One way');

INSERT INTO tickettype(tickettype.TicketTypeID ,tickettype.TicketTypeName) values (11,'Two Way');

SELECT * from tickettype;


/*---------------------------------*/ 
/*Reservation Table*/

INSERT INTO reservation(reservation.ReservationID ,reservation.ReservationDate ,reservation.CustomerId,reservation.FlightID,reservation.TicketTypeID,reservation.SeatBooked) values (2001,'2017-10-19 12:23:00',2142,'KL-360',10,2);
INSERT INTO reservation(reservation.ReservationID ,reservation.ReservationDate ,reservation.CustomerId,reservation.FlightID,reservation.TicketTypeID,reservation.SeatBooked) values (2002,'2017-10-20 12:23:00',2147,'KL-712',11,4);


/*---------------------------------*/

INSERT INTO reservation(reservation.ReservationID ,reservation.ReservationDate ,reservation.CustomerId,reservation.FlightID,reservation.TicketTypeID,reservation.SeatBooked) values (2003,'2017-10-21 12:12:00',2198,'EM-549',11,5);

INSERT INTO reservation(reservation.ReservationID ,reservation.ReservationDate ,reservation.CustomerId,reservation.FlightID,reservation.TicketTypeID,reservation.SeatBooked) values (2004,'2017-10-22 12:23:00',2149,'EM-360',10,12);

INSERT INTO reservation(reservation.ReservationID ,reservation.ReservationDate ,reservation.CustomerId,reservation.FlightID,reservation.TicketTypeID,reservation.SeatBooked) values (2005,'2017-10-23 12:23:00',2147,'KL-360',10,6);
INSERT INTO reservation(reservation.ReservationID ,reservation.ReservationDate ,reservation.CustomerId,reservation.FlightID,reservation.TicketTypeID,reservation.SeatBooked) values (2006,'2017-10-24 12:23:00',2142,'AF-360',11,8);



SELECT * FROM reservation;
/*---------------------------------*/ 
/*Payment Method*/

INSERT INTO paymentmethod(paymentmethod.PaymentMethodId,paymentmethod.PaymentInvoiceCode) values (51,'Cash');
INSERT INTO paymentmethod(paymentmethod.PaymentMethodId,paymentmethod.PaymentInvoiceCode) values (52,'Card');

Select * from paymentmethod;
/*-------------------------------*/ 
/* Payment Method */
INSERT INTO payment(payment.PaymentId,payment.PaymentDate,payment.PaymentAmount,payment.PaymentMethodId,payment.ReservationID) values (6000,'2017-10-19 10:40:00',3200,52,2001);
INSERT INTO payment(payment.PaymentId,payment.PaymentDate,payment.PaymentAmount,payment.PaymentMethodId,payment.ReservationID) values (6001,'2017-10-20 10:40:00',2240,52,2002);

SELECT * from payment;
/*--------------------------------------------------------------*/
/* SeatBooked */

INSERT INTO seatbooked(seatbooked.SeatNumber,seatbooked.SeatType,seatbooked.Reservation_ReservationID) values (23,'Ecomony',2001);
INSERT INTO seatbooked(seatbooked.SeatNumber,seatbooked.SeatType,seatbooked.Reservation_ReservationID) values (28,'Ecomony',2001);
INSERT INTO seatbooked(seatbooked.SeatNumber,seatbooked.SeatType,seatbooked.Reservation_ReservationID) values (24,'Busines',2002);

select * from seatbooked;

/*----------------Create Stored Procedure--To Calculate Revenue of  Top AirLiner*/
DELIMITER $$
create procedure CalculateRevenuesByAirline()
BEGIN
SELECT airliner.AirlinerName , sum(Price * flight.TotalSeatBooked) as rev from flight
INNER JOIN airliner
ON
airliner.AirlinerId = flight.AirlinerId
GROUP BY AirlinerName
order by rev desc
limit 1;
END$$
delimiter ;
call CalculateRevenuesByAirline();
/*----------------Create Stored Procedure--To View customer record by passing booking id */
DELIMITER $$
create procedure viewCustomerRecordByBookingId(param1 INT)
BEGIN
select c.FirstName,c.LastName,r.ReservationID,r.ReservationDate,r.TicketTypeID,r.FlightID,s.SeatNumber,s.SeatType
from customer as c
inner join reservation as r
on
c.CustomerId  = r.CustomerId
inner join seatbooked as s on
r.ReservationID = s.Reservation_ReservationID

where c.CustomerId = param1;
END$$
delimiter ;
call viewCustomerRecordByBookingId(2142);
/*-------------------------------------------------------------------------------*/
/*-------------Find First Available Plane------------------------------------*/
DELIMITER $$
create procedure firstAvailableFlight(param datetime)
BEGIN
SELECT flight.DepartureTime as 'FirstAvailableFlight' ,flight.Source,flight.Destination from flight 
WHERE flight.DepartureTime > param
order by flight.DepartureTime asc
limit 1;
END$$
delimiter 
call firstAvailableFlight('2017-12-08 08:40:00');
 /*-----------------------------------------------------------------------------------*/

/* -----------------Change Maintaince Certificate ------*/


DELIMITER $$
create procedure changeMaintanceCertificateStatus(flightID varchar(30),CertificateId INT)
BEGIN
	
    
    UPDATE flight
SET flight.CertificateId = CertificateId
WHERE flight.FlightID = flightID;
    
    
    
END$$
delimiter ;

Select * from flight;
call changeMaintanceCertificateStatus('KL-713',1);




/*--------------Triggers ----------------------------------------------------*/
/*-----------If Total seat capacity for the airplane is booked User should not able to Book Ticket*/
DROP TRIGGER example_before_book_seat;

select * from flight;
select * from reservation;
delete from reservation where ReservationID = 2015;
INSERT INTO reservation(reservation.ReservationID ,reservation.ReservationDate ,reservation.CustomerId,reservation.FlightID,reservation.TicketTypeID,reservation.SeatBooked) values (2015,'2017-10-24 12:23:00',2142,'KL-712',11,3);

create user 'reservationAdmin'@'localhost' identified by 'reservationAdmin';
grant select,update,delete on reservation to 'reservationAdmin'@'localhost';


DELIMITER $$
CREATE TRIGGER example_before_book_seat
     BEFORE INSERT ON reservation FOR EACH ROW
    
     BEGIN
           DECLARE xid INT;
            declare yid int;
          
          
          select TotalSeatBooked,TotalSeatCapacity  from flight  where flight.FlightID  = new.flightid into xid,yid;
         
          if(yid < xid + new.SeatBooked)
     
          THEN
               SIGNAL SQLSTATE '45000'
                    SET MESSAGE_TEXT = 'Can not able to Book seat.All seats for this flighr are booked';
          END IF;
     END;
$$
/*----------------------------------------------End------------------*/
select * from flight;
select * from reservation;
INSERT INTO reservation(reservation.ReservationID ,reservation.ReservationDate ,reservation.CustomerId,reservation.FlightID,reservation.TicketTypeID,reservation.SeatBooked) values (2016 ,'2017-10-24 12:23:00',2142,'KL-713',11,1);
drop trigger example_increment_by_one;
/*----------Triggers--------iNCREMENT FlIGHTSEATS BY SEAT BOOKED ------------------*/
DELIMITER $$
CREATE TRIGGER example_increment_by_one
     after INSERT ON reservation FOR EACH ROW
    
     BEGIN
           DECLARE xid INT;
           declare yid int;
			declare zid Int;
          select TotalSeatBooked,TotalSeatCapacity  from flight  where flight.FlightID  = new.flightid into xid,yid;
		
        
        if(yid > xid + new.SeatBooked)
     
          THEN
	  UPDATE flight

         SET TotalSeatBooked = xid + NEW.SeatBooked
         WHERE flight.FlightID = NEW.flightid ;
          
          END IF;
  
     END;
$$

select * from flight;
select * from reservation;
delete from reservation where ReservationID = 2014;
INSERT INTO reservation(reservation.ReservationID ,reservation.ReservationDate ,reservation.CustomerId,reservation.FlightID,reservation.TicketTypeID,reservation.SeatBooked) values (2014 ,'2017-10-24 12:23:00',2142,'KL-713',11,4);
drop trigger delete_booking;

/*-------------------Delete Booking--------------*/ 
DELIMITER $$
CREATE TRIGGER delete_booking 
     after delete ON reservation FOR EACH ROW
     
     BEGIN
           DECLARE xid INT;
           declare yid int;
			declare zid Int;
          select TotalSeatBooked,TotalSeatCapacity  from flight  where flight.FlightID  = old.flightid into xid,yid;
		
        
        
	  UPDATE flight

         SET TotalSeatBooked = xid - old.SeatBooked
         WHERE flight.FlightID = old.flightid ;
          
          
  
     END;
$$

CREATE VIEW bookingViewInformationTable AS
  SELECT 
     c.CustomerId,c.FirstName,
     r.ReservationID, r.ReservationDate, r.FlightID, p.PaymentId,p.PaymentDate,p.PaymentMethodId
  FROM
     customer as c
     INNER JOIN reservation as r ON c.CustomerId = r.CustomerId
     INNER JOIN payment as p    ON r.ReservationID = p.ReservationID
  WHERE
     p.PaymentAmount > 500;
