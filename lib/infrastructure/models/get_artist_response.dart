
class GetArtistResponse {
    final Followers followers;
    final List<String> genres;
    final String href;
    final String id;
    final List<Imagen> images;
    final String name;
    final int popularity;
    final String type;
    final String uri;

    GetArtistResponse({
        required this.followers,
        required this.genres,
        required this.href,
        required this.id,
        required this.images,
        required this.name,
        required this.popularity,
        required this.type,
        required this.uri,
    });

    factory GetArtistResponse.fromJson(Map<String, dynamic> json) => GetArtistResponse(
        followers: Followers.fromJson(json["followers"]),
        genres: List<String>.from(json["genres"].map((x) => x)),
        href: json["href"],
        id: json["id"],
        images: List<Imagen>.from(json["images"].map((x) => Imagen.fromJson(x))),
        name: json["name"],
        popularity: json["popularity"],
        type: json["type"],
        uri: json["uri"],
    );

    Map<String, dynamic> toJson() => {
        "followers": followers.toJson(),
        "genres": List<dynamic>.from(genres.map((x) => x)),
        "href": href,
        "id": id,
        "images": List<dynamic>.from(images.map((x) => x.toJson())),
        "name": name,
        "popularity": popularity,
        "type": type,
        "uri": uri,
    };
}


class Followers {
    final dynamic href;
    final int total;

    Followers({
        required this.href,
        required this.total,
    });

    factory Followers.fromJson(Map<String, dynamic> json) => Followers(
        href: json["href"],
        total: json["total"],
    );

    Map<String, dynamic> toJson() => {
        "href": href,
        "total": total,
    };
}

class Imagen {
    final int height;
    final String url;
    final int width;

    Imagen({
        required this.height,
        required this.url,
        required this.width,
    });

    factory Imagen.fromJson(Map<String, dynamic> json) => Imagen(
        height: json["height"],
        url: json["url"],
        width: json["width"],
    );

    Map<String, dynamic> toJson() => {
        "height": height,
        "url": url,
        "width": width,
    };
}
