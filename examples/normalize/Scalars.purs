module Examples.Normalize.Scalars where

import Prelude (class Eq, class Ord, class Show)
import Data.Newtype (class Newtype)
import GraphQLClient
  (class GraphQLDefaultResponseScalarDecoder, class ToGraphQLArgumentValue)

-- | original name - CatId
newtype CatId = CatId String

derive newtype instance eqCatId :: Eq CatId

derive newtype instance ordCatId :: Ord CatId

derive newtype instance showCatId :: Show CatId

derive instance newtypeCatId :: Newtype CatId _

derive newtype instance graphQlDefaultResponseScalarDecoderCatId :: GraphQLDefaultResponseScalarDecoder CatId

derive newtype instance toGraphQlArgumentValueCatId :: ToGraphQLArgumentValue CatId

-- | original name - DogId
newtype DogId = DogId String

derive newtype instance eqDogId :: Eq DogId

derive newtype instance ordDogId :: Ord DogId

derive newtype instance showDogId :: Show DogId

derive instance newtypeDogId :: Newtype DogId _

derive newtype instance graphQlDefaultResponseScalarDecoderDogId :: GraphQLDefaultResponseScalarDecoder DogId

derive newtype instance toGraphQlArgumentValueDogId :: ToGraphQLArgumentValue DogId

-- | original name - ID
newtype Id = Id String

derive newtype instance eqId :: Eq Id

derive newtype instance ordId :: Ord Id

derive newtype instance showId :: Show Id

derive instance newtypeId :: Newtype Id _

derive newtype instance graphQlDefaultResponseScalarDecoderId :: GraphQLDefaultResponseScalarDecoder Id

derive newtype instance toGraphQlArgumentValueId :: ToGraphQLArgumentValue Id
