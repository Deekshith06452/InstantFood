<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt"%>

<jsp:include page="partials/header.jsp" />
<jsp:include page="partials/navbar.jsp" />

<section class="checkout-section">
	<h1 class="checkout-title">Checkout</h1>
	<div class="checkout-container">
		<div class="checkout-form">
			<h2>Delivery Details</h2>
			<form action="${pageContext.request.contextPath}/placeOrder"
				method="post">
				<div class="checkout-group">
					<label>Full Name</label>
					<div class="checkout-input-wrap">
						<svg width="16" height="16" viewBox="0 0 24 24" fill="none"
							stroke="currentColor" stroke-width="2">
							<circle cx="12" cy="8" r="4" />
							<path d="M4 20c0-4 4-6 8-6s8 2 8 6" />
						</svg>
						<input type="text" name="deliveryName" value="${user.fullName}"
							required>
					</div>
				</div>
				<div class="checkout-group">
					<label>Phone</label>
					<div class="checkout-input-wrap">
						<svg width="16" height="16" viewBox="0 0 24 24" fill="none"
							stroke="currentColor" stroke-width="2">
							<rect x="7" y="2" width="10" height="20" rx="2" />
							<line x1="11" y1="18" x2="13" y2="18" />
						</svg>
						<input type="text" name="deliveryPhone" value="${user.phone}"
							required>
					</div>
				</div>
				<div class="checkout-group">
					<label>Delivery Address</label>
					<div class="checkout-input-wrap">
						<svg width="16" height="16" viewBox="0 0 24 24" fill="none"
							stroke="currentColor" stroke-width="2">
							<path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0118 0z" />
							<circle cx="12" cy="10" r="3" />
						</svg>
						<input type="text" name="deliveryAddress" value="${user.address}"
							required>
					</div>
				</div>
				<div class="checkout-group">
					<label>City</label>
					<div class="checkout-input-wrap">
						<svg width="16" height="16" viewBox="0 0 24 24" fill="none"
							stroke="currentColor" stroke-width="2">
							<polygon points="1 6 1 22 8 18 16 22 23 18 23 2 16 6 8 2 1 6" />
						</svg>
						<input type="text" name="deliveryCity" value="${user.city}"
							required>
					</div>
				</div>

				<!-- ===== PAYMENT METHOD ===== -->
				<div class="checkout-group">
					<label>Payment Method</label>
					<div class="payment-options">
						<label class="payment-option" id="cod-option"> <input
							type="radio" name="paymentMethod" value="COD" checked
							onchange="selectPayment('cod')">
							<div class="payment-option-content">
								<svg width="22" height="22" viewBox="0 0 24 24" fill="none"
									stroke="#ff6a3d" stroke-width="2">
									<rect x="2" y="6" width="20" height="12" rx="2" />
									<line x1="2" y1="10" x2="22" y2="10" />
									<line x1="6" y1="14" x2="10" y2="14" />
								</svg>
								<div>
									<strong>Cash on Delivery</strong> <span>Pay when your
										order arrives</span>
								</div>
							</div>
							<div class="payment-check">
								<svg width="14" height="14" viewBox="0 0 24 24" fill="none"
									stroke="white" stroke-width="3">
									<polyline points="20 6 9 17 4 12" />
								</svg>
							</div>
						</label> <label class="payment-option" id="upi-option"> <input
							type="radio" name="paymentMethod" value="UPI"
							onchange="selectPayment('upi')">
							<div class="payment-option-content">
								<svg width="22" height="22" viewBox="0 0 24 24" fill="none"
									stroke="#ff6a3d" stroke-width="2">
									<rect x="5" y="2" width="14" height="20" rx="2" />
									<line x1="12" y1="18" x2="12" y2="18" />
									<circle cx="12" cy="18" r="1" fill="#ff6a3d" />
								</svg>
								<div>
									<strong>UPI Payment</strong> <span>Pay via GPay,
										PhonePe, Paytm</span>
								</div>
							</div>
							<div class="payment-check">
								<svg width="14" height="14" viewBox="0 0 24 24" fill="none"
									stroke="white" stroke-width="3">
									<polyline points="20 6 9 17 4 12" />
								</svg>
							</div>
						</label>
					</div>
				</div>

				<!-- UPI ID input — shown only when UPI selected -->
				<div class="checkout-group" id="upi-id-group" style="display: none;">
					<label>UPI ID</label>
					<div class="checkout-input-wrap">
						<svg width="16" height="16" viewBox="0 0 24 24" fill="none"
							stroke="currentColor" stroke-width="2">
							<path d="M20 21v-2a4 4 0 00-4-4H8a4 4 0 00-4 4v2" />
							<circle cx="12" cy="7" r="4" />
						</svg>
						<input type="text" name="upiId" placeholder="e.g. yourname@upi">
					</div>
				</div>

				<button type="submit" class="place-order-btn">
					<svg width="16" height="16" viewBox="0 0 24 24" fill="none"
						stroke="currentColor" stroke-width="2">
						<path d="M5 12h14M13 5l7 7-7 7" />
					</svg>
					Place Order
				</button>
			</form>
		</div>

		<div class="checkout-summary">
			<h2>Order Summary</h2>
			<c:forEach var="item" items="${cartItems}">
				<div class="checkout-item">
					<img
						src="${pageContext.request.contextPath}/assets/images/${item.imageUrl}"
						alt="${item.itemName}">
					<div class="checkout-item-info">
						<p class="checkout-item-name">${item.itemName}</p>
						<p class="checkout-item-qty">Qty: ${item.quantity}</p>
					</div>
					<p class="checkout-item-price">
						&#8377;
						<fmt:formatNumber value="${item.totalPrice}" pattern="#,##0.00" />
					</p>
				</div>
			</c:forEach>
			<div class="checkout-divider"></div>
			<div class="checkout-total">
				<span>Total Amount</span> <span>&#8377;<fmt:formatNumber
						value="${total}" pattern="#,##0.00" /></span>
			</div>
		</div>
	</div>
</section>

<script>
	function selectPayment(type) {
		var codOption = document.getElementById('cod-option');
		var upiOption = document.getElementById('upi-option');
		var upiGroup = document.getElementById('upi-id-group');

		if (type === 'upi') {
			upiOption.classList.add('selected');
			codOption.classList.remove('selected');
			upiGroup.style.display = 'flex';
		} else {
			codOption.classList.add('selected');
			upiOption.classList.remove('selected');
			upiGroup.style.display = 'none';
		}
	}

	// Set initial selected state
	document.getElementById('cod-option').classList.add('selected');
</script>

<jsp:include page="partials/footer.jsp" />