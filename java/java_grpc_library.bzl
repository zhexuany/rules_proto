load("//java:java_grpc_compile.bzl", "java_grpc_compile")

def java_grpc_library(**kwargs):
    name = kwargs.get("name")
    deps = kwargs.get("deps")
    proto_path = kwargs.get("proto_path")
    visibility = kwargs.get("visibility")

    print(proto_path)
    name_pb = name + "_pb"
    java_grpc_compile(
        name = name_pb,
        deps = deps,
        proto_path = proto_path,
        transitive = True,
        visibility = visibility,
    )
    native.java_library(
        name = name,
        srcs = [name_pb],
        deps = [str(Label("//java:grpc_deps"))],
        exports = [
            str(Label("//java:grpc_deps")),
        ],
        visibility = visibility,
    )
