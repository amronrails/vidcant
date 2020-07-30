module Types
  class ProvinceType < Types::BaseObject
    field :id, ID, null: false
    field :pruid, Integer, null: true
    field :prname, String, null: true
    field :name, String, null: true
    field :prnameFR, String, null: true
    field :date, GraphQL::Types::ISO8601Date, null: true
    field :numconf, Integer, null: true
    # field :numprob, Integer, null: true
    field :numdeaths, Integer, null: true
    field :numtotal, Integer, null: true
    # field :numtested, Integer, null: true
    field :numrecover, Integer, null: true
    # field :percentrecover, Types::DecimalType, null: true
    field :ratetested, Integer, null: true
    # field :numtoday, Integer, null: true
    # field :percentoday, Types::DecimalType, null: true
    field :ratetotal, Float, null: true
    # field :ratedeaths, Types::DecimalType, null: true
    # field :deathstoday, Integer, null: true
    field :percentdeath, Float, null: true
    # field :testedtoday, Integer, null: true
    # field :recoveredtoday, Integer, null: true
    # field :percentactive, Types::DecimalType, null: true
    field :numactive, Integer, null: true
    # field :rateactive, Types::DecimalType, null: true
    # field :numtotal_last14, Integer, null: true
    # field :ratetotal_last14, Types::DecimalType, null: true
    # field :numdeaths_last14, Integer, null: true
    # field :ratedeaths_last14, Types::DecimalType, null: true
    # field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    # field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
