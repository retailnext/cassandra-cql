=begin
Copyright 2011 Inside Systems, Inc.

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
=end

module CassandraCQL
  module Types
    class DecimalType < AbstractType
      def self.cast(value)
        return nil if value.empty?
        BigDecimal.new(bytes_to_int(value[4..-1]).to_s) * BigDecimal.new('10')**(bytes_to_int(value[0..3])*-1)
      end
    end
  end
end
