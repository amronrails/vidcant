module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    # TODO: remove me
    # field :test_field, String, null: false,
    #   description: "An example field added by the generator"
    # def test_field
    #   "Hello World!"
    # end
    field :provinces, [Types::ProvinceType], null: false,
    description: "returns list of provinces"

    field :canada, [Types::ProvinceType], null: false,
    description: "returns list of provinces"
    
    field :radar, [Types::ProvinceType], null:false,
    description: "returns the performance of the biggest 3 proviences"

    def provinces
      Province.where.not(pruid: 1)
    end
    def canada
      Province.where(pruid: 1).last(10)
    end
    def radar
      Province.find_by_sql "
        Select prname as name, numconf, ratetotal, numdeaths, percentdeath, ratetested, numactive
        FROM provinces where (prname = 'Ontario' OR prname = 'Quebec' OR prname = 'British Columbia')
        AND
        date = (select max(pr.date) from provinces as pr)
        order by numconf DESC
      " 
    end

  end
end
