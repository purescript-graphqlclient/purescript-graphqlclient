module GraphqlClientGenerator.MakeModule.Subscription where

import Data.Array.NonEmpty (NonEmptyArray)
import GraphqlClientGenerator.IntrospectionSchema (InstorpectionQueryResult__Field)
import GraphqlClientGenerator.MakeModule.Lib.DeclarationsForFields as DeclarationsForFields

import Language.PS.SmartCST

makeModule
  :: (String -> String)
  -> ModuleName
  -> NonEmptyArray String
  -> ModuleName
  -> Array InstorpectionQueryResult__Field
  -> Module
makeModule
  nameToScope
  scalarModule
  apiModuleName
  moduleName
  fields = Module
  { moduleName
  , exports: []
  , declarations: DeclarationsForFields.declarationsForFields { apiModuleName, scalarModule } nameToScope "RootSubscription" fields
  }
