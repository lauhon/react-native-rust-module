import Foundation

func handle_error<T, U>(
  resolve: RCTPromiseResolveBlock,
  reject: RCTPromiseRejectBlock,
  get_result: (UnsafeMutablePointer<ExternError>) -> T,
  success: (T) -> U
) -> Void {
  var err = ExternError()
  let err_ptr: UnsafeMutablePointer<ExternError> = UnsafeMutablePointer(&err)
  let res = get_result(err_ptr)
  if err_ptr.pointee.code == 0 {
    resolve(success(res))
  } else {
    let val = String(cString: err_ptr.pointee.message)
    signer_destroy_string(err_ptr.pointee.message)
    reject(String(describing: err_ptr.pointee.code), val, nil)
  }
}

@objc(Rust)
class Rust: NSObject {

    @objc(helloWorld:withRejecter:)
    func multiply(_ resolve:RCTPromiseResolveBlock,reject:RCTPromiseRejectBlock) -> Void {
        handle_error(
              resolve: resolve,
              reject: reject,
              get_result: { hello_world($0) },
              success: { (res: Optional<UnsafePointer<CChar>>) -> String in
                let val = String(cString: res!)
                signer_destroy_string(res!)
                return val
            })
    }
}
