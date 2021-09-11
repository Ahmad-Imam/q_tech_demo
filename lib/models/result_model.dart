import 'dart:convert';

Result productFromJson(String str) => Result.fromJson(json.decode(str));

String productToJson(Result data) => json.encode(data.toJson());
class Result {
  late int id;
  late int maximumOrder;
  late List<CategoryList> categoryList;
  late  String productName;
  late  String sku;
  late String slug;
  late  String buisnessName;
  late  int sellerId;
  late  String sellerSlug;
  late  bool willShowEmi;
  late  Brand brand;
  late  String note;
  late  int stock;
  late  bool preOrder;
  late  int bookingPrice;
  late  int productPrice;
  late  Null discountCharge;
  late  String image;
  late  List<String> detailsImages;
  late  bool isEvent;
  late  Null eventId;
  late  bool highlight;
  late  Null highlightId;
  late  bool groupping;
  late  Null grouppingId;
  late  Null campaignSectionId;
  late  bool campaignSection;
  late  Null message;
  late  bool seo;
  late  String metaKeyword;
  late  String metaDescription;
  late  Null variation;
  late  String bannerImage;
  late String bannerImageLink;
  late  Null attributeValue;
  late Null iconSpecification;
  late  int productReviewAvg;

  Result(
      {required this.id,
        required this.maximumOrder,
        required this.categoryList,
        required this.productName,
        required  this.sku,
        required  this.slug,
        required  this.buisnessName,
        required  this.sellerId,
        required this.sellerSlug,
        required  this.willShowEmi,
        required   this.brand,
        required this.note,
        required this.stock,
        required this.preOrder,
        required  this.bookingPrice,
        required this.productPrice,
        required  this.discountCharge,
        required this.image,
        required  this.detailsImages,
        required  this.isEvent,
        required this.eventId,
        required this.highlight,
        required  this.highlightId,
        required  this.groupping,
        required  this.grouppingId,
        required  this.campaignSectionId,
        required this.campaignSection,
        required this.message,
        required  this.seo,
        required  this.metaKeyword,
        required this.metaDescription,
        required  this.variation,
        required  this.bannerImage,
        required  this.bannerImageLink,
        this.attributeValue,
        this.iconSpecification,
        required  this.productReviewAvg});

  Result.fromJson(Map<String, dynamic> json) {
      id = json['id'];
      maximumOrder = json['maximum_order'];
    if (json['category_list'] != null) {
      categoryList = <CategoryList>[];
      json['category_list'].forEach((v) {
        categoryList.add(new CategoryList.fromJson(v));
      });
    }
    productName = json['product_name'];
    sku = json['sku'];
    slug = json['slug'];
    buisnessName = json['buisness_name'];
    sellerId = json['seller_id'];
    sellerSlug = json['seller_slug'];
    willShowEmi = json['will_show_emi'];
    brand = (json['brand'] != null ? Brand.fromJson(json['brand']) : null)!;
    note = json['note'];
    stock = json['stock'];
    preOrder = json['pre_order'];
    bookingPrice = json['booking_price'];
    productPrice = json['product_price'];
    discountCharge = json['discount_charge'];
    image = json['image'];
    detailsImages = json['details_images'].cast<String>();
    isEvent = json['is_event'];
    eventId = json['event_id'];
    highlight = json['highlight'];
    highlightId = json['highlight_id'];
    groupping = json['groupping'];
    grouppingId = json['groupping_id'];
    campaignSectionId = json['campaign_section_id'];
    campaignSection = json['campaign_section'];
    message = json['message'];
    seo = json['seo'];
    metaKeyword = json['meta_keyword'];
    metaDescription = json['meta_description'];
    variation = json['variation'];
    bannerImage = json['banner_image'];
    bannerImageLink = json['banner_image_link'];
    attributeValue = json['attribute_value'];
    iconSpecification = json['icon_specification'];
    productReviewAvg = json['product_review_avg'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['maximum_order'] = this.maximumOrder;
    if (this.categoryList != null) {
      data['category_list'] = this.categoryList.map((v) => v.toJson()).toList();
    }
    data['product_name'] = this.productName;
    data['sku'] = this.sku;
    data['slug'] = this.slug;
    data['buisness_name'] = this.buisnessName;
    data['seller_id'] = this.sellerId;
    data['seller_slug'] = this.sellerSlug;
    data['will_show_emi'] = this.willShowEmi;
    if (this.brand != null) {
      data['brand'] = this.brand.toJson();
    }
    data['note'] = this.note;
    data['stock'] = this.stock;
    data['pre_order'] = this.preOrder;
    data['booking_price'] = this.bookingPrice;
    data['product_price'] = this.productPrice;
    data['discount_charge'] = this.discountCharge;
    data['image'] = this.image;
    data['details_images'] = this.detailsImages;
    data['is_event'] = this.isEvent;
    data['event_id'] = this.eventId;
    data['highlight'] = this.highlight;
    data['highlight_id'] = this.highlightId;
    data['groupping'] = this.groupping;
    data['groupping_id'] = this.grouppingId;
    data['campaign_section_id'] = this.campaignSectionId;
    data['campaign_section'] = this.campaignSection;
    data['message'] = this.message;
    data['seo'] = this.seo;
    data['meta_keyword'] = this.metaKeyword;
    data['meta_description'] = this.metaDescription;
    data['variation'] = this.variation;
    data['banner_image'] = this.bannerImage;
    data['banner_image_link'] = this.bannerImageLink;
    data['attribute_value'] = this.attributeValue;
    data['icon_specification'] = this.iconSpecification;
    data['product_review_avg'] = this.productReviewAvg;
    return data;
  }
}

class CategoryList {
 late int id;
 late  String categoryName;
 late String slug;
 late bool isInactive;
 late String image;
 late String categoryIcon;
 late String parent;
 late String parentSlug;

  CategoryList(
      {required this.id,
        required this.categoryName,
        required this.slug,
        required  this.isInactive,
        required this.image,
        required this.categoryIcon,
        required this.parent,
        required this.parentSlug});

  CategoryList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryName = json['category_name'];
    slug = json['slug'];
    isInactive = json['is_inactive'];
    image = json['image'];
    categoryIcon = json['category_icon'];
    parent = json['parent'];
    parentSlug = json['parent_slug'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['category_name'] = this.categoryName;
    data['slug'] = this.slug;
    data['is_inactive'] = this.isInactive;
    data['image'] = this.image;
    data['category_icon'] = this.categoryIcon;
    data['parent'] = this.parent;
    data['parent_slug'] = this.parentSlug;
    return data;
  }
}

class Brand {
  late int id;
  late String name;
  late String slug;
  late String image;

  Brand({required this.id, required this.name, required this.slug, required this.image});

  Brand.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    slug = json['slug'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['slug'] = this.slug;
    data['image'] = this.image;
    return data;
  }
}