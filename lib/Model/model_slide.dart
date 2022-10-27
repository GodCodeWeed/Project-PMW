

class SlideModel {
  final String imageUrl;
  final String title;
  final String description;

  SlideModel(
      {required this.imageUrl,
      required this.title,
      required this.description});
}

final slideList = [
  SlideModel(
      imageUrl: 'assets/Images/image1.jpg',
      title: 'A Land Of Opputunity.',
      description:
          'Make your dreams come alife. This  is platform created for poeple with the fire and the hustle in them to succeed. Join hustle can partner with like minds inyour field to make money on the go.'),
  SlideModel(
      imageUrl: 'assets/Images/image2.jpg',
      title: 'Get anything done.',
      description:
          'Looking for a Job to get done? not worry at Hustle we have thousands of expirienced professionals, who can get the job done in a jiphy.'),
  SlideModel(
      imageUrl: 'assets/Images/image3.jpg',
      title: 'Show Us your Hustle.',
      description:
          'The world has been waiting for your hustle now the time for you show it to the whole world, whatever it is, theres somoene out there in need of your services.'),

];
