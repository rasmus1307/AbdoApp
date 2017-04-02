import Alamofire

enum RouterShareCode: URLRequestConvertible {
    case create(deviceUUID: String, childUUID: String, shareCode: String)
    case read(deviceUUID: String, childUUID: String)
    case update(deviceUUID: String, childUUID: String, shareCode: String)
    case destroy(deviceUUID: String, childUUID: String)
    
    static let baseURLString = Singleton.SharedInstance.urlBase
    
    var method: HTTPMethod {
        switch self {
        case .create:
            return .post
        case .read:
            return .get
        case .update:
            return .put
        case .destroy:
            return .delete
        }
    }
    
    var path: String {
        switch self {
        case .create(let deviceUUID, let childUUID, let sharecode):
            return "/registration/\(deviceUUID)/\(childUUID)/\(sharecode)"
        case .read(let deviceUUID, let childUUID):
            return "/registration/\(deviceUUID)/\(childUUID)"
        case .update(let deviceUUID, let childUUID, let sharecode):
            return "/registration/\(deviceUUID)/\(childUUID)/\(sharecode)"
        case .destroy(let deviceUUID, let childUUID):
            return "/registration/\(deviceUUID)/\(childUUID)"
        }
    }
    
    // MARK: URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        let url = try RouterShareCode.baseURLString.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
//        switch self {
//        case .create(_, _, let parameters):
//            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
//        case .update(_, _, let parameters):
//            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
//        default:
//            break
//        }
        
        return urlRequest
    }
}
