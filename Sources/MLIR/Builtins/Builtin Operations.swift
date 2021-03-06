extension Operation where Results == () {
  /**
   - precondition: `blocks` must contain at least one block
   */
  public static func function(
    _ name: String,
    returnTypes: [ContextualType] = [],
    attributes: [ContextualNamedAttributeProtocol] = [],
    blocks: [Block],
    at location: Location
  ) -> Self {
    let entryBlock = blocks.first!

    var attributes = attributes

    /// These will hopefully be able to use dot syntax in Swift 5.5
    attributes.append(ContextualNamedAttribute.symbolName(name))
    attributes.append(
      ContextualNamedAttribute.type(
        FunctionType.function(of: entryBlock.arguments.map(\.type), to: returnTypes)))

    return Self(
      builtin: "func",
      attributes: attributes,
      operands: [],
      resultTypes: [],
      ownedRegions: [
        Region(ownedBlocks: blocks)
      ],
      location: location)
  }
}
