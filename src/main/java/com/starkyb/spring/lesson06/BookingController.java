package com.starkyb.spring.lesson06;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.starkyb.spring.lesson06.bo.BookingBO;

@Controller
@RequestMapping("/lesson06")
public class BookingController {
	@Autowired
	private BookingBO bookingBO;
	
	@GetMapping("/booking_info")
	public String bookingInfo(Model model) {
		model.addAttribute("result", bookingBO.getBooking());
		
		return "lesson06/test03/bookingInfo";
	}
	
	@GetMapping("/booking_delete")
	@ResponseBody
	public Map<String, String> delete(@RequestParam("bookingId") int bookingId) {
		int count = bookingBO.deleteBooking(bookingId);
		
		Map<String, String> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
	
	@GetMapping("/add_booking_view")
	public String addBookingView() {
		return "lesson06/test03/addBooking";
	}
	
	@GetMapping("/add_booking")
	@ResponseBody
	public Map<String, Object> Booking(
			@RequestParam("name") String name
			, @RequestParam("date") String date
			, @RequestParam("day") int day
			, @RequestParam("headcount") int headcount
			, @RequestParam("phoneNumber") String phoneNumber) {
		int count = bookingBO.addBooking(name, date, day, headcount, phoneNumber);
		
		Map<String, Object> result = new HashMap<>();
		
		if(count == 1) {
			result.put("result", "success");
		} else {
			result.put("result", "fail");
		}
		
		return result;
	}
}
