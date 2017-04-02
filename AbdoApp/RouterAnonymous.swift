import Alamofire

enum RouterAnonymous: URLRequestConvertible {
    case create(parameters: Parameters)
    case read(deviceUUID: String)
    case update(deviceUUID: String, parameters: Parameters)
    case destroy(deviceUUID: String)
    
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
        case .create:
            return "/anonymous"
        case .read(let deviceUUID):
            return "/anonymous/\(deviceUUID)"
        case .update(let deviceUUID, _):
            return "/anonymous/\(deviceUUID)"
        case .destroy(let deviceUUID):
            return "/anonymous/\(deviceUUID)"
        }
    }
    
    // MARK: URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        let url = try RouterAnonymous.baseURLString.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .create(let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .update(_, let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        default:
            break
        }
        
        return urlRequest
    }
}
