class NewsModel {
  const NewsModel({
    this.title,
    this.description,
    this.image_url,
    this.url,
    this.uuid,
});

  final String url, image_url, description,uuid, title;
  // in case if you want to fetch data
  NewsModel.fromJson(Map<String, dynamic>json):
      title=  json['title'],
      description= json['description'],
      url = json['url'],
      image_url = json['image_url'],
      uuid = json['uuid'];
}

final List<NewsModel> NEWS_LIST = [
  NewsModel(
    uuid: "ea39d5f2-8d9c-46fe-9a9d-ee1b0ad02755",
    title:
    "Woman discovers boyfriend is cheating from Starbucks coffee cup, she claims in viral TikTok",
    image_url:
    "https://article.thenewsapi.com/image/ea39d5f2-8d9c-46fe-9a9d-ee1b0ad02755",
    description: "Those on TikTok were not buying his explanation.",
    url: "https://article.thenewsapi.com/ea39d5f2-8d9c-46fe-9a9d-ee1b0ad02755",
  ),
  NewsModel(
    uuid: "d22bd677-35a3-4232-84db-fcec65c1a644",
    title:
    "Ron Johnson to bring Ken Starr to testify at controversial hearing on 2020 elections",
    description:
    "Sen. Ron Johnson, the chairman of the Homeland Security and ...",
    url: "https://article.thenewsapi.com/d22bd677-35a3-4232-84db-fcec65c1a644",
    image_url:
    "https://article.thenewsapi.com/image/d22bd677-35a3-4232-84db-fcec65c1a644",
  ),
  NewsModel(
    uuid: "66ab0771-2731-415e-b817-ae7f1d34bd9d",
    title: "Fox News Poll: Most Republicans say President Trump was robbed",
    description:
    "Sixty-eight percent of Republicans believe the election was ...",
    url: "https://article.thenewsapi.com/66ab0771-2731-415e-b817-ae7f1d34bd9d",
    image_url:
    "https://article.thenewsapi.com/image/66ab0771-2731-415e-b817-ae7f1d34bd9d",
  ),
];