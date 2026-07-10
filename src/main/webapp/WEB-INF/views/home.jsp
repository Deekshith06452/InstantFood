<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<jsp:include page="partials/header.jsp" />
<jsp:include page="partials/navbar.jsp" />

<section class="hero-section">
	<div class="hero-left">
		<span class="hero-tag"> <svg width="13" height="13"
				viewBox="0 0 24 24" fill="currentColor">
				<path d="M13 2L3 14h7l-1 8 11-12h-7l1-8z" /></svg> FAST DELIVERY, EVERY
			TIME
		</span>
		<h1>
			Order Food,<br> <span class="accent">Anytime, Anywhere</span>
		</h1>
		<p>Discover the best restaurants near you and get food delivered
			fast to your doorstep.</p>
		<a href="#restaurants-section" class="hero-cta"> Order Now <svg
				width="16" height="16" viewBox="0 0 24 24" fill="none"
				stroke="currentColor" stroke-width="2">
				<path d="M5 12h14M13 5l7 7-7 7" /></svg>
		</a>
	</div>
	<div class="hero-right">
		<img
			src="${pageContext.request.contextPath}/assets/images/hero-banner.jpg"
			alt="Delicious food" class="hero-image">
		<div class="hero-info-box">
			<div class="hero-info-item">
				<svg width="18" height="18" viewBox="0 0 24 24" fill="none"
					stroke="#ff6a3d" stroke-width="2">
					<circle cx="5" cy="18" r="2" />
					<circle cx="19" cy="18" r="2" />
					<path d="M5 18h2l3-7h4l2 4h3" /></svg>
				<div>
					<strong>Fast Delivery</strong><span>30-40 min</span>
				</div>
			</div>
			<div class="hero-info-item">
				<svg width="18" height="18" viewBox="0 0 24 24" fill="none"
					stroke="#ff6a3d" stroke-width="2">
					<line x1="19" y1="5" x2="5" y2="19" />
					<circle cx="6.5" cy="6.5" r="2.5" />
					<circle cx="17.5" cy="17.5" r="2.5" /></svg>
				<div>
					<strong>Best Offers</strong><span>Up to 60% OFF</span>
				</div>
			</div>
			<div class="hero-info-item">
				<svg width="18" height="18" viewBox="0 0 24 24" fill="none"
					stroke="#ff6a3d" stroke-width="2">
					<polygon
						points="12 2 15 8.5 22 9.5 17 14.5 18.5 21.5 12 18 5.5 21.5 7 14.5 2 9.5 9 8.5 12 2" /></svg>
				<div>
					<strong>Top Rated</strong><span>4.5+ Ratings</span>
				</div>
			</div>
		</div>
	</div>
</section>

<section class="categories-section">
	<div class="section-row-header">
		<h2>Inspiration for your first order</h2>
		<a href="${pageContext.request.contextPath}/home"
			class="view-all-link"> View All <svg width="14" height="14"
				viewBox="0 0 24 24" fill="none" stroke="currentColor"
				stroke-width="2">
				<path d="M9 18l6-6-6-6" /></svg>
		</a>
	</div>

	<div class="categories-carousel-wrapper">
		<button class="carousel-arrow carousel-arrow-left" id="catPrev"
			aria-label="Scroll left">
			<svg width="18" height="18" viewBox="0 0 24 24" fill="none"
				stroke="currentColor" stroke-width="2.5">
				<path d="M15 18l-6-6 6-6" />
			</svg>
		</button>

		<div class="categories-track" id="categoriesTrack">

			<a href="${pageContext.request.contextPath}/restaurant?id=1"
				class="category-card">
				<div class="category-circle">
					<img
						src="${pageContext.request.contextPath}/assets/images/categories/burgers.jpg"
						alt="Burgers" />
				</div> <span class="category-name">Burgers</span>
			</a> <a href="${pageContext.request.contextPath}/restaurant?id=11"
				class="category-card">
				<div class="category-circle">
					<img
						src="${pageContext.request.contextPath}/assets/images/categories/pizzas.jpg"
						alt="Pizzas" />
				</div> <span class="category-name">Pizzas</span>
			</a> <a href="${pageContext.request.contextPath}/restaurant?id=3"
				class="category-card">
				<div class="category-circle">
					<img
						src="${pageContext.request.contextPath}/assets/images/categories/biryani.jpg"
						alt="Biryani" />
				</div> <span class="category-name">Biryani</span>
			</a> <a href="${pageContext.request.contextPath}/restaurant?id=12"
				class="category-card">
				<div class="category-circle">
					<img
						src="${pageContext.request.contextPath}/assets/images/categories/chicken.jpg"
						alt="Chicken" />
				</div> <span class="category-name">Chicken</span>
			</a> <a href="${pageContext.request.contextPath}/restaurant?id=20"
				class="category-card">
				<div class="category-circle">
					<img
						src="${pageContext.request.contextPath}/assets/images/categories/cakes.jpg"
						alt="Cakes" />
				</div> <span class="category-name">Cakes</span>
			</a> <a href="${pageContext.request.contextPath}/restaurant?id=20"
				class="category-card">
				<div class="category-circle">
					<img
						src="${pageContext.request.contextPath}/assets/images/categories/desserts.jpg"
						alt="Desserts" />
				</div> <span class="category-name">Desserts</span>
			</a> <a href="${pageContext.request.contextPath}/restaurant?id=5"
				class="category-card">
				<div class="category-circle">
					<img
						src="${pageContext.request.contextPath}/assets/images/categories/dosa.jpg"
						alt="Dosa" />
				</div> <span class="category-name">Dosa</span>
			</a> <a href="${pageContext.request.contextPath}/restaurant?id=19"
				class="category-card">
				<div class="category-circle">
					<img
						src="${pageContext.request.contextPath}/assets/images/categories/grills.jpg"
						alt="Grills" />
				</div> <span class="category-name">Grills</span>
			</a> <a href="${pageContext.request.contextPath}/restaurant?id=15"
				class="category-card">
				<div class="category-circle">
					<img
						src="${pageContext.request.contextPath}/assets/images/categories/noodles.jpg"
						alt="Noodles" />
				</div> <span class="category-name">Noodles</span>
			</a> <a href="${pageContext.request.contextPath}/restaurant?id=20"
				class="category-card">
				<div class="category-circle">
					<img
						src="${pageContext.request.contextPath}/assets/images/categories/ice-cream.jpg"
						alt="Ice Cream" />
				</div> <span class="category-name">Ice Cream</span>
			</a> <a href="${pageContext.request.contextPath}/restaurant?id=16"
				class="category-card">
				<div class="category-circle">
					<img
						src="${pageContext.request.contextPath}/assets/images/categories/coffee.jpg"
						alt="Coffee" />
				</div> <span class="category-name">Coffee</span>
			</a>

		</div>

		<button class="carousel-arrow carousel-arrow-right" id="catNext"
			aria-label="Scroll right">
			<svg width="18" height="18" viewBox="0 0 24 24" fill="none"
				stroke="currentColor" stroke-width="2.5">
				<path d="M9 18l6-6-6-6" />
			</svg>
		</button>
	</div>
</section>

<script>
	(function() {
		var track = document.getElementById('categoriesTrack');
		var prevBtn = document.getElementById('catPrev');
		var nextBtn = document.getElementById('catNext');
		var scrollAmount = 320;

		function updateArrows() {
			prevBtn.style.opacity = track.scrollLeft <= 0 ? '0.3' : '1';
			prevBtn.style.pointerEvents = track.scrollLeft <= 0 ? 'none'
					: 'auto';
			var atEnd = track.scrollLeft + track.clientWidth >= track.scrollWidth - 2;
			nextBtn.style.opacity = atEnd ? '0.3' : '1';
			nextBtn.style.pointerEvents = atEnd ? 'none' : 'auto';
		}

		prevBtn.addEventListener('click', function() {
			track.scrollBy({
				left : -scrollAmount,
				behavior : 'smooth'
			});
		});
		nextBtn.addEventListener('click', function() {
			track.scrollBy({
				left : scrollAmount,
				behavior : 'smooth'
			});
		});
		track.addEventListener('scroll', updateArrows);
		updateArrows();
	})();
</script>

<section class="restaurants-section" id="restaurants-section">
	<div class="section-row-header">
		<h2>
			<c:choose>
				<c:when test="${not empty selectedCuisine}">${selectedCuisine} Restaurants</c:when>
				<c:when test="${not empty selectedCategory}">${selectedCategory} Restaurants</c:when>
				<c:otherwise>Restaurants Near You</c:otherwise>
			</c:choose>
		</h2>
		<c:if
			test="${not empty selectedCuisine or not empty selectedCategory}">
			<a href="${pageContext.request.contextPath}/home"
				class="view-all-link"> View All <svg width="14" height="14"
					viewBox="0 0 24 24" fill="none" stroke="currentColor"
					stroke-width="2">
					<path d="M9 18l6-6-6-6" /></svg>
			</a>
		</c:if>
	</div>
	<div class="restaurant-grid">
		<c:forEach var="restaurant" items="${restaurants}">
			<a
				href="${pageContext.request.contextPath}/restaurant?id=${restaurant.restaurantId}"
				class="restaurant-card">
				<div class="restaurant-img-wrap">
					<img
						src="${pageContext.request.contextPath}/assets/images/${restaurant.imageUrl}"
						alt="${restaurant.name}">
					
				</div>
				<div class="restaurant-card-body">
					<h3>${restaurant.name}</h3>
					<span class="cuisine">${restaurant.cuisineType}</span>
					<p class="restaurant-address">
						<svg width="12" height="12" viewBox="0 0 24 24" fill="none"
							stroke="currentColor" stroke-width="2">
							<path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0118 0z" />
							<circle cx="12" cy="10" r="3" />
						</svg>
						${restaurant.address}, ${restaurant.city}
					</p>
					<div class="restaurant-meta">
						<span class="rating"><span class="rating-badge">&#9733;</span>
							${restaurant.rating}</span> <span class="delivery-time">${restaurant.deliveryTime}
							mins</span>
					</div>
					<div class="restaurant-bottom-row">
						<p class="min-order">Min order: &#8377;${restaurant.minOrder}</p>
						<span class="free-delivery-tag">FREE DELIVERY</span>
					</div>
				</div>
			</a>
		</c:forEach>
	</div>
</section>

<section class="trust-section">
	<div class="trust-item">
		<svg width="22" height="22" viewBox="0 0 24 24" fill="none"
			stroke="#ff6a3d" stroke-width="2">
			<circle cx="5" cy="18" r="2" />
			<circle cx="19" cy="18" r="2" />
			<path d="M5 18h2l3-7h4l2 4h3" /></svg>
		<div>
			<strong>Lightning Fast Delivery</strong><span>On time, every
				time</span>
		</div>
	</div>
	<div class="trust-item">
		<svg width="22" height="22" viewBox="0 0 24 24" fill="none"
			stroke="#ff6a3d" stroke-width="2">
			<line x1="19" y1="5" x2="5" y2="19" />
			<circle cx="6.5" cy="6.5" r="2.5" />
			<circle cx="17.5" cy="17.5" r="2.5" /></svg>
		<div>
			<strong>Best Offers &amp; Discounts</strong><span>Save more on
				every order</span>
		</div>
	</div>
	<div class="trust-item">
		<svg width="22" height="22" viewBox="0 0 24 24" fill="none"
			stroke="#ff6a3d" stroke-width="2">
			<path d="M12 2l8 4v6c0 5-3.5 8.5-8 10-4.5-1.5-8-5-8-10V6l8-4z" /></svg>
		<div>
			<strong>Safe &amp; Secure Payments</strong><span>100% secure
				transactions</span>
		</div>
	</div>
	<div class="trust-item">
		<svg width="22" height="22" viewBox="0 0 24 24" fill="none"
			stroke="#ff6a3d" stroke-width="2">
			<path
				d="M3 11a9 9 0 0118 0M5 19v-5a2 2 0 012-2h0v7zM17 19v-5a2 2 0 00-2-2h0v7z" /></svg>
		<div>
			<strong>24/7 Customer Support</strong><span>We're always here
				to help</span>
		</div>
	</div>
</section>

<jsp:include page="partials/footer.jsp" />