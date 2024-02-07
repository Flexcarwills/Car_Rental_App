class DetailsOfIntro {
  const DetailsOfIntro(
      {required this.image, required this.title, required this.description});

  final String image;
  final String title;
  final String description;
}

final Onboardingcontents = [
  const DetailsOfIntro(
      image: 'assets/images/Image1.json',
      title: 'Book Your Ride',
      description: 'Book Your Car at affordable Prices'),
  const DetailsOfIntro(
      image: 'assets/images/image3.json',
      title: 'Easy Booking',
      description:
          'Book a car in just a few clicks. Choose from a wide range of cars that suit your needs and budget.'),
  const DetailsOfIntro(
      image: 'assets/images/image2.json',
      title: '24/7 customer support',
      description:
          'Our customer support team is available round the clock to assist you with any queries or issues you may have'),
  const DetailsOfIntro(
      image: 'assets/images/Image1.json',
      title: 'Flexible rental options',
      description:
          'Rent a car for a day, a week, or even a month. We offer flexible rental options to suit your schedule.'),
];
