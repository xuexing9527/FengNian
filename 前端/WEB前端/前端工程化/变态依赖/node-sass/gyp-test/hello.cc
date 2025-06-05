#include <node.h>

void HelloMethod(const v8::FunctionCallbackInfo<v8::Value>& args) {
  args.GetReturnValue().Set(v8::String::NewFromUtf8(args.GetIsolate(), "Hello world").ToLocalChecked());
}

void Initialize(v8::Local<v8::Object> exports) {
  NODE_SET_METHOD(exports, "hello", HelloMethod);
}

NODE_MODULE(NODE_GYP_MODULE_NAME, Initialize)
