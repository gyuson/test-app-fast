import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fast_flutter_template/common/repositories/firebase_repository.dart';
import 'package:fast_flutter_template/features/authentication/providers/user_provider.dart';
import 'package:fast_flutter_template/features/meditation/models/session.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'meditation_repository.g.dart';

@Riverpod(keepAlive: true)
MeditationRepository meditationReposiory(MeditationReposioryRef ref) {
  return MeditationRepository(ref);
}

class MeditationRepository extends FirebaseRepository<Session> {
  final MeditationReposioryRef ref;

  MeditationRepository(this.ref)
      : super(
            collection: FirebaseFirestore.instance
                .collection('users')
                .doc(ref.read(userIdProvider))
                .collection('sessions'),
            toFirestore: (session, _) =>
                session.copyWith(id: ref.read(docIdProvider)).toJson(),
            fromFirestore: (snapshot, _) => Session.fromJson(snapshot.data()!));

  void saveSession(Session session) {
    add(session, session.id);
  }

  Stream<List<Session>> getSessions() {
    return streamDocuments();
  }
}
