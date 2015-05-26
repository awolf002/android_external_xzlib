# Copyright (C) 2015 Mocana
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
LOCAL_PATH:= $(call my-dir)

xzlib_files := \
	../common/tuklib_physmem.c \
	../common/tuklib_cpucores.c \
	common/common.c \
	common/block_util.c \
	common/easy_preset.c \
	common/filter_common.c \
	common/hardware_physmem.c \
	common/index.c \
	common/stream_flags_common.c \
	common/vli_size.c \
	common/alone_encoder.c \
	common/block_buffer_encoder.c \
	common/block_encoder.c \
	common/block_header_encoder.c \
	common/easy_buffer_encoder.c \
	common/easy_encoder.c \
	common/easy_encoder_memusage.c \
	common/filter_buffer_encoder.c \
	common/filter_encoder.c \
	common/filter_flags_encoder.c \
	common/index_encoder.c \
	common/stream_buffer_encoder.c \
	common/stream_encoder.c \
	common/stream_flags_encoder.c \
	common/vli_encoder.c \
	common/hardware_cputhreads.c \
	common/outqueue.c \
	common/stream_encoder_mt.c \
	common/alone_decoder.c \
	common/auto_decoder.c \
	common/block_buffer_decoder.c \
	common/block_decoder.c \
	common/block_header_decoder.c \
	common/easy_decoder_memusage.c \
	common/filter_buffer_decoder.c \
	common/filter_decoder.c \
	common/filter_flags_decoder.c \
	common/index_decoder.c \
	common/index_hash.c \
	common/stream_buffer_decoder.c \
	common/stream_decoder.c \
	common/stream_flags_decoder.c \
	common/vli_decoder.c

xzlib_files += \
	check/check.c \
	check/crc32_table.c \
	check/crc32_x86.S \
	check/crc64_table.c \
	check/crc64_x86.S \
	check/sha256.c

#	check/crc32_small.c \
#	check/crc32_fast.c \
#	check/crc64_small.c \
#	check/crc64_fast.c \

xzlib_files += \
	lz/lz_encoder.c \
	lz/lz_encoder_mf.c \
	lz/lz_decoder.c \
	lzma/lzma_encoder.c \
	lzma/lzma_encoder_presets.c \
	lzma/lzma_encoder_optimum_fast.c \
	lzma/lzma_encoder_optimum_normal.c \
	lzma/fastpos_table.c \
	lzma/lzma_decoder.c \
	lzma/lzma2_encoder.c \
	lzma/lzma2_decoder.c \
	rangecoder/price_table.c

xzlib_files += \
	delta/delta_common.c \
	delta/delta_encoder.c \
	delta/delta_decoder.c \
	simple/simple_coder.c \
	simple/simple_encoder.c \
	simple/simple_decoder.c \
	simple/x86.c \
	simple/powerpc.c \
	simple/ia64.c \
	simple/arm.c \
	simple/armthumb.c \
	simple/sparc.c

include $(CLEAR_VARS)

LOCAL_MODULE := liblzma-host
LOCAL_MODULE_TAGS := optional
LOCAL_CFLAGS += -std=gnu99 -fPIC -DPIC -DHAVE_CONFIG_H -DTUKLIB_SYMBOL_PREFIX=lzma_ \
	-pthread -MP -fvisibility=hidden -Wall -Wextra -Wvla -Wformat=2 -Winit-self -Wstrict-aliasing \
	-Wfloat-equal -Wshadow -Wpointer-arith -Wbad-function-cast -Wwrite-strings -Wlogical-op -Waggregate-return \
	-Wstrict-prototypes -Wold-style-definition -Wmissing-prototypes -Wmissing-declarations -Wmissing-noreturn -Wredundant-decls

LOCAL_C_INCLUDES += \
	$(LOCAL_PATH)/../.. $(LOCAL_PATH)/../../src/liblzma/api $(LOCAL_PATH)/../../src/liblzma/common \
	$(LOCAL_PATH)/../../src/liblzma/check $(LOCAL_PATH)/../../src/liblzma/lz $(LOCAL_PATH)/../../src/liblzma/rangecoder \
	$(LOCAL_PATH)/../../src/liblzma/lzma $(LOCAL_PATH)/../../src/liblzma/delta $(LOCAL_PATH)/../../src/liblzma/simple \
	$(LOCAL_PATH)/../../src/common

LOCAL_SRC_FILES := $(xzlib_files)
LOCAL_LDLIBS += -lpthread -lm -lrt

include $(BUILD_HOST_SHARED_LIBRARY)
