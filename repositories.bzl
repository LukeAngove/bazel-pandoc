load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

def pandoc_repositories():
    http_archive(
        name = "pandoc_bin_linux",
        build_file_content = """
filegroup(
    name = "pandoc",
    srcs = ["bin/pandoc"],
    visibility = ["//visibility:public"],
)""",
        sha256 = "",
        strip_prefix = "pandoc-2.7.2",
        url = "https://github.com/jgm/pandoc/releases/download/2.7.2/pandoc-2.7.2-linux.tar.gz",
    )

    http_archive(
        name = "pandoc_bin_macOS",
        build_file_content = """
filegroup(
    name = "pandoc",
    srcs = ["bin/pandoc"],
    visibility = ["//visibility:public"],
)""",
        sha256 = "b42c96829db8356dbbb8ffe81ca23b915188ee6a39a3e07958ba613aa88b6b15",
        strip_prefix = "pandoc-2.7.2",
        url = "https://github.com/jgm/pandoc/releases/download/2.7.2/pandoc-2.7.2-macOS.zip",
    )

    http_archive(
        name = "pandoc_bin_windows-i386",
        build_file_content = """
filegroup(
    name = "pandoc",
    srcs = ["pandoc.exe"],
    visibility = ["//visibility:public"],
)""",
        sha256 = "",
        strip_prefix = "pandoc-2.7.2-windows-i386",
        url = "https://github.com/jgm/pandoc/releases/download/2.7.2/pandoc-2.7.2-windows-i386.zip",
    )

    http_archive(
        name = "pandoc_bin_windows-x86_64",
        build_file_content = """
filegroup(
    name = "pandoc",
    srcs = ["pandoc.exe"],
    visibility = ["//visibility:public"],
)""",
        sha256 = "",
        strip_prefix = "pandoc-2.7.2-windows-x86_64",
        url = "https://github.com/jgm/pandoc/releases/download/2.7.2/pandoc-2.7.2-windows-x86_64.zip",
    )

    native.register_toolchains(
        "@bazel_pandoc//:pandoc_toolchain_linux",
        "@bazel_pandoc//:pandoc_toolchain_macOS",
        "@bazel_pandoc//:pandoc_toolchain_windows-i386",
        "@bazel_pandoc//:pandoc_toolchain_windows-x86_64",
    )
