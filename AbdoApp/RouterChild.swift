import Alamofire

enum RouterChild: URLRequestConvertible {
    case create(deviceUUID: String, parameters: Parameters)
    case read(deviceUUID: String, childUUID: String)
    case update(deviceUUID: String, parameters: Parameters)
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
        case .create(let deviceUUID, _):
            return "/child/\(deviceUUID)"
        case .read(let deviceUUID, let childUUID):
            return "/child/\(deviceUUID)/\(childUUID)"
        case .update(let deviceUUID, _):
            return "/child/\(deviceUUID)"
        case .destroy(let deviceUUID, let childUUID):
            return "/child/\(deviceUUID)/\(childUUID)"
        }
    }
    
    // MARK: URLRequestConvertible
    
    func asURLRequest() throws -> URLRequest {
        let url = try RouterChild.baseURLString.asURL()
        
        var urlRequest = URLRequest(url: url.appendingPathComponent(path))
        urlRequest.httpMethod = method.rawValue
        
        switch self {
        case .create(_, let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        case .update(_, let parameters):
            urlRequest = try JSONEncoding.default.encode(urlRequest, with: parameters)
        default:
            break
        }
        
        return urlRequest
    }
}
