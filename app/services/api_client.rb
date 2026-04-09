
class ApiClient
    BACKEND_URL = Rails.application.credentials.backend_url
    include HTTParty

    ### GET ENDPOINTS ###
    def self.getBackendHealth
        HTTParty.get("#{BACKEND_URL}/health")
    end

    def self.getEvents
        HTTParty.get("#{BACKEND_URL}/dynamic?table=event")
    end

    def self.getResources
        HTTParty.get("#{BACKEND_URL}/dynamic?table=resource")
    end

    def self.getClasses
        HTTParty.get("#{BACKEND_URL}/dynamic?table=class")
    end

    ### POST ENDPOINTS ###
    def self.postEvent(id, data)
        HTTParty.post("#{BACKEND_URL}/dynamic?table=event&id=#{id}", body: data)
    end

    def self.postResource(id, data)
        HTTParty.post("#{BACKEND_URL}/dynamic?table=resource&id=#{id}", body: data)
    end

    def self.postClass(id, data)
        HTTParty.post("#{BACKEND_URL}/dynamic?table=class&id=#{id}", body: data)
    end


    ### DELETE ENDPOINTS ###
    def self.deleteEvent(id)
        HTTParty.delete("#{BACKEND_URL}/dynamic?table=event&id=#{id}")
    end

    def self.deleteResource(id)
        HTTParty.delete("#{BACKEND_URL}/dynamic?table=resource&id=#{id}")
    end

    def self.deleteClass(id)
        HTTParty.delete("#{BACKEND_URL}/dynamic?table=class&id=#{id}")
    end
end