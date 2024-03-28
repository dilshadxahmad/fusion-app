import 'package:flutter/material.dart';
import 'package:fusion_app/models/home/comment_response_model.dart';
import 'package:fusion_app/repository/home/home_repository.dart';

class HomeViewController extends ChangeNotifier {
  final List<Comment> _comments = [];
  List<Comment> get comments => _comments;

  final _api = HomeRepository();

  Future<void> getComments() async {
    _api.getComments().then((value) {
      for (var comment in value.comment ?? []) {
        _comments.add(comment);
        _comments;
      }
    }).onError((error, stackTrace) {
      throw error.toString();
    });
    notifyListeners();
  }
}
