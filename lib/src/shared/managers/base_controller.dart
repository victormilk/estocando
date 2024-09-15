import 'package:estocando_flutter/src/shared/managers/base_state.dart';
import 'package:flutter/foundation.dart';

abstract class BaseController<S extends BaseState>
    implements ValueListenable<S> {
  late final ValueNotifier<S> _stateNotifier;
  bool _isDisposed = false;

  BaseController(S initialState) {
    this._stateNotifier = ValueNotifier(initialState);
  }

  @override
  void addListener(VoidCallback listener) {
    this._stateNotifier.addListener(listener);
  }

  @override
  void removeListener(VoidCallback listener) {
    this._stateNotifier.removeListener(listener);
  }

  @override
  S get value => this._stateNotifier.value;

  S get state => this._stateNotifier.value;

  @protected
  void emit(S state) {
    if (_isDisposed) return;
    this._stateNotifier.value = state;
  }

  void dispose() {
    if (_isDisposed) return;
    _isDisposed = true;
    this._stateNotifier.dispose();
  }
}
