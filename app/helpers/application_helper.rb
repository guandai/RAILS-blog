module ApplicationHelper
    class Hashit
      def initialize(hash)
        hash.each do |k,v|
          self.instance_variable_set("@#{k}", v.is_a?(Hash) ? Hashit.new(v) : v)
          self.class.send(:define_method, k, proc{self.instance_variable_get("@#{k}")})
          self.class.send(:define_method, "#{k}=", proc{|v| self.instance_variable_set("@#{k}", v)})
        end
      end
    end



def tr( *str )
	#str.each {  }  
  p str
  
end


def swfverToIntstr(testStr)
  case testStr
      when "10.0"
        testStr="10"
      when "10.2"
        testStr="11"
      when "11.1"
        testStr="14"
      when "11.2"
        testStr="15"
      when "11.7"
        testStr="20"
      else
        testStr="10"
     end
  return testStr
end






  def escapechar(mod)
   mod = mod.to_s.gsub("Dropbox \(Personal\)","Dropbox")
   return mod
  end
 




end
