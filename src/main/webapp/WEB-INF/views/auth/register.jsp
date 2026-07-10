<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<jsp:include page="../partials/header.jsp" />
<script>
	document.body.classList.add('auth-locked');
</script>

<div class="auth-page">
	<div class="auth-left"
		style="background-image: url('${pageContext.request.contextPath}/assets/images/login-bg.jpg');">
		<div class="auth-left-content">
			<div class="auth-logo">
				<svg width="24" height="24" viewBox="0 0 24 24" fill="none"
					stroke="#ff6a3d" stroke-width="2">
					<path d="M3 12h13a4 4 0 00-4-4H7a4 4 0 00-4 4z" />
					<line x1="2" y1="16" x2="20" y2="16" /></svg>
				Instant<span class="accent">Food</span>
			</div>

			<div class="auth-badge">
				<svg width="13" height="13" viewBox="0 0 24 24" fill="currentColor">
					<path d="M13 2L3 14h7l-1 8 11-12h-7l1-8z" /></svg>
				START YOUR FOOD JOURNEY
			</div>

			<h1 class="auth-hero-title">
				Create Your <span class="accent">Account!</span>
			</h1>
			<p class="auth-hero-subtitle">Sign up and explore the best food
				around you</p>
			<p class="auth-hero-text">Get access to exclusive deals,
				real-time order tracking, and food from your favorite local
				restaurants — all in one place.</p>

			<div class="auth-features">
				<div class="auth-feature">
					<div class="auth-feature-icon">
						<svg width="18" height="18" viewBox="0 0 24 24" fill="none"
							stroke="#ff6a3d" stroke-width="2">
							<circle cx="5" cy="18" r="2" />
							<circle cx="19" cy="18" r="2" />
							<path d="M5 18h2l3-7h4l2 4h3" /></svg>
					</div>
					<div>
						<p class="auth-feature-title">Fast Delivery</p>
						<p class="auth-feature-sub">On time, every time</p>
					</div>
				</div>
				<div class="auth-feature">
					<div class="auth-feature-icon">
						<svg width="18" height="18" viewBox="0 0 24 24" fill="none"
							stroke="#ff6a3d" stroke-width="2">
							<line x1="19" y1="5" x2="5" y2="19" />
							<circle cx="6.5" cy="6.5" r="2.5" />
							<circle cx="17.5" cy="17.5" r="2.5" /></svg>
					</div>
					<div>
						<p class="auth-feature-title">Best Offers</p>
						<p class="auth-feature-sub">Exciting deals</p>
					</div>
				</div>
				<div class="auth-feature">
					<div class="auth-feature-icon">
						<svg width="18" height="18" viewBox="0 0 24 24" fill="none"
							stroke="#ff6a3d" stroke-width="2">
							<path
								d="M3 2v7c0 1.1.9 2 2 2s2-.9 2-2V2M5 11v11M19 2c-2 0-3 2-3 4v4c0 1 1 2 2 2h1v9" /></svg>
					</div>
					<div>
						<p class="auth-feature-title">Top Restaurants</p>
						<p class="auth-feature-sub">Quality you love</p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="auth-right">
		<div class="auth-card">
			<h2>
				Create Your <span class="accent">Account</span>
			</h2>
			<p class="auth-card-subtitle">Fill in your details to get
				started.</p>

			<c:if test="${not empty error}">
				<p class="auth-error">${error}</p>
			</c:if>

			<form action="${pageContext.request.contextPath}/register"
				method="post">
				<div class="auth-field">
					<label>Full Name</label>
					<div class="input-wrapper">
						<span class="input-icon"> <svg width="16" height="16"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2">
								<circle cx="12" cy="8" r="4" />
								<path d="M4 20c0-4 4-6 8-6s8 2 8 6" /></svg>
						</span> <input type="text" name="fullName"
							placeholder="Enter your full name" required>
					</div>
				</div>

				<div class="auth-field">
					<label>Email Address</label>
					<div class="input-wrapper">
						<span class="input-icon"> <svg width="16" height="16"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2">
								<rect x="3" y="5" width="18" height="14" rx="2" />
								<path d="M3 7l9 6 9-6" /></svg>
						</span> <input type="email" name="email" placeholder="Enter your email"
							required>
					</div>
				</div>

				<div class="auth-field">
					<label>Phone Number</label>
					<div class="input-wrapper">
						<span class="input-icon"> <svg width="16" height="16"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2">
								<rect x="7" y="2" width="10" height="20" rx="2" />
								<line x1="11" y1="18" x2="13" y2="18" /></svg>
						</span> <input type="text" name="phone"
							placeholder="Enter your phone number" required>
					</div>
				</div>

				<div class="auth-field">
					<label>Password</label>
					<div class="input-wrapper">
						<span class="input-icon"> <svg width="16" height="16"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2">
								<rect x="5" y="11" width="14" height="9" rx="2" />
								<path d="M8 11V7a4 4 0 018 0v4" /></svg>
						</span> <input type="password" name="password" id="passwordField"
							placeholder="Create a password" required>
						<button type="button" class="input-toggle"
							onclick="togglePassword()">
							<span id="eyeIcon"> <svg width="16" height="16"
									viewBox="0 0 24 24" fill="none" stroke="currentColor"
									stroke-width="2">
									<path d="M1 12s4-7 11-7 11 7 11 7-4 7-11 7-11-7-11-7z" />
									<circle cx="12" cy="12" r="3" /></svg>
							</span>
						</button>
					</div>
				</div>

				<div class="auth-field">
					<label>Address</label>
					<div class="input-wrapper">
						<span class="input-icon"> <svg width="16" height="16"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2">
								<path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 1118 0z" />
								<circle cx="12" cy="10" r="3" /></svg>
						</span> <input type="text" name="address"
							placeholder="Enter your address" required>
					</div>
				</div>

				<div class="auth-field">
					<label>City</label>
					<div class="input-wrapper">
						<span class="input-icon"> <svg width="16" height="16"
								viewBox="0 0 24 24" fill="none" stroke="currentColor"
								stroke-width="2">
								<polygon points="1 6 1 22 8 18 16 22 23 18 23 2 16 6 8 2 1 6" /></svg>
						</span> <input type="text" name="city" placeholder="Enter your city"
							required>
					</div>
				</div>

				<button type="submit" class="auth-btn">
					<svg width="16" height="16" viewBox="0 0 24 24" fill="none"
						stroke="currentColor" stroke-width="2">
						<path d="M5 12h14M13 5l7 7-7 7" /></svg>
					Create Account
				</button>
			</form>

			<p class="auth-switch">
				Already have an account?
				<a href="${pageContext.request.contextPath}/login">Login here</a>
			</p>
		</div>
	</div>
</div>

<p class="auth-minimal-footer">&copy; 2026 InstantFood. All Rights
	Reserved.</p>

<script>
	function togglePassword() {
		var pwd = document.getElementById('passwordField');
		var icon = document.getElementById('eyeIcon');
		if (pwd.type === 'password') {
			pwd.type = 'text';
			icon.innerHTML = '<svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M17.94 17.94A10.94 10.94 0 0112 19c-7 0-11-7-11-7a18.5 18.5 0 015.06-5.94M9.9 4.24A10.94 10.94 0 0112 4c7 0 11 7 11 7a18.5 18.5 0 01-2.16 3.19M14.12 14.12a3 3 0 11-4.24-4.24"/><line x1="1" y1="1" x2="23" y2="23"/></svg>';
		} else {
			pwd.type = 'password';
			icon.innerHTML = '<svg width="16" height="16" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"><path d="M1 12s4-7 11-7 11 7 11 7-4 7-11 7-11-7-11-7z"/><circle cx="12" cy="12" r="3"/></svg>';
		}
	}
</script>