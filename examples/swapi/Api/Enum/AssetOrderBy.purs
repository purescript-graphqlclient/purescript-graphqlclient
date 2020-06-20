module Api.Enum.AssetOrderBy where

-- | original type - AssetOrderBy
data AssetOrderBy
  = CreatedAtAsc
  | CreatedAtDesc
  | FileNameAsc
  | FileNameDesc
  | HandleAsc
  | HandleDesc
  | HeightAsc
  | HeightDesc
  | IdAsc
  | IdDesc
  | MimeTypeAsc
  | MimeTypeDesc
  | SizeAsc
  | SizeDesc
  | UpdatedAtAsc
  | UpdatedAtDesc
  | UrlAsc
  | UrlDesc
  | WidthAsc
  | WidthDesc

fromToMap :: Array (String /\ AssetOrderBy)
fromToMap = ["createdAt_ASC" /\ CreatedAtAsc, "createdAt_DESC" /\ CreatedAtDesc, "fileName_ASC" /\ FileNameAsc, "fileName_DESC" /\ FileNameDesc, "handle_ASC" /\ HandleAsc, "handle_DESC" /\ HandleDesc, "height_ASC" /\ HeightAsc, "height_DESC" /\ HeightDesc, "id_ASC" /\ IdAsc, "id_DESC" /\ IdDesc, "mimeType_ASC" /\ MimeTypeAsc, "mimeType_DESC" /\ MimeTypeDesc, "size_ASC" /\ SizeAsc, "size_DESC" /\ SizeDesc, "updatedAt_ASC" /\ UpdatedAtAsc, "updatedAt_DESC" /\ UpdatedAtDesc, "url_ASC" /\ UrlAsc, "url_DESC" /\ UrlDesc, "width_ASC" /\ WidthAsc, "width_DESC" /\ WidthDesc]

instance assetOrderByGraphqlDefaultResponseScalarDecoder :: GraphqlDefaultResponseScalarDecoder AssetOrderBy where
  graphqlDefaultResponseScalarDecoder = enumDecoder "AssetOrderBy" fromToMap
