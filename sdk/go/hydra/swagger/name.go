/*
 * ORY Hydra - Cloud Native OAuth 2.0 and OpenID Connect Server
 *
 * Welcome to the ORY Hydra HTTP API documentation. You will find documentation for all HTTP APIs here. Keep in mind that this document reflects the latest branch, always. Support for versioned documentation is coming in the future.
 *
 * OpenAPI spec version: Latest
 * Contact: hi@ory.am
 * Generated by: https://github.com/swagger-api/swagger-codegen.git
 */

package swagger

// Name represents an X.509 distinguished name. This only includes the common elements of a DN. When parsing, all elements are stored in Names and non-standard elements can be extracted from there. When marshaling, elements in ExtraNames are appended and override other values with the same OID.
type Name struct {
	Country []string `json:"Country,omitempty"`

	ExtraNames []AttributeTypeAndValue `json:"ExtraNames,omitempty"`

	Locality []string `json:"Locality,omitempty"`

	Names []AttributeTypeAndValue `json:"Names,omitempty"`

	SerialNumber string `json:"SerialNumber,omitempty"`

	StreetAddress []string `json:"StreetAddress,omitempty"`
}