## Versioning

[Back](../new)

Each request has a `schemaVersion` element indicating which release of the schema is being used in the request and expected schema format in the response. Important: All clients must accept new (unknown) elements in the response. E.g. unknown elements should be ignored. The client framework used by client must thus not crash when unknown elements are encountered. Note that this requirement excludes the (old, but still widely used) Apache Axis 1.x Web Service client framework.

[Back](../new)
