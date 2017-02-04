/* -*- coding: utf-8 -*- */
/*
 *  Developer name : ADMIS_Walker
 *  Blog           : https://admiswalker.blogspot.jp/
 *  Profile        : https://admiswalker.blogspot.jp/p/profile.html
 *
 *
 *  The MIT License (MIT)
 *  
 *  Copyright (c) 2017 ADMIS_Walker
 *  
 *  Permission is hereby granted, free of charge, to any person obtaining a copy
 *  of this software and associated documentation files (the "Software"), to deal
 *  in the Software without restriction, including without limitation the rights
 *  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 *  copies of the Software, and to permit persons to whom the Software is
 *  furnished to do so, subject to the following conditions:
 *  
 *  The above copyright notice and this permission notice shall be included in
 *  all copies or substantial portions of the Software.
 *  
 *  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 *  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 *  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 *  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 *  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 *  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 *  THE SOFTWARE.
 *
 *
 *  ���{���
 *  
 *  The MIT License
 *  Copyright (c) 2017 ADMIS_Walker
 *  
 *  �ȉ��ɒ�߂�����ɏ]���C�{�\�t�g�E�F�A����ъ֘A�����̃t�@�C��
 *  �i�ȉ��u�\�t�g�E�F�A�v�j�̕������擾���邷�ׂĂ̐l�ɑ΂��C�\�t�g�E�F�A�𖳐���
 *  �Ɉ������Ƃ𖳏��ŋ����܂��D����ɂ́C�\�t�g�E�F�A�̕������g�p�C���ʁC�ύX�C
 *  �����C�f�ځC�Еz�C�T�u���C�Z���X�C�����/�܂��͔̔����錠���C����у\�t�g�E�F�A
 *  ��񋟂��鑊��ɓ������Ƃ������錠�����������Ɋ܂܂�܂��D
 *  
 *  ��L�̒��쌠�\������і{�����\�����C�\�t�g�E�F�A�̂��ׂĂ̕����܂��͏d�v�ȕ���
 *  �ɋL�ڂ�����̂Ƃ��܂��D
 *  
 *  �\�t�g�E�F�A�́u����̂܂܁v�ŁC�����ł��邩�Öقł��邩���킸�C����̕ۏ؂�
 *  �Ȃ��񋟂���܂��D�����ł����ۏ؂Ƃ́C���i���C����̖ړI�ւ̓K�����C����ь���
 *  ��N�Q�ɂ��Ă̕ۏ؂��܂݂܂����C����Ɍ��肳�����̂ł͂���܂���D ��҂܂�
 *  �͒��쌠�҂́C�_��s�ׁC�s�@�s�ׁC�܂��͂���ȊO�ł��낤�ƁC�\�t�g�E�F�A�ɋN��
 *  �܂��͊֘A���C���邢�̓\�t�g�E�F�A�̎g�p�܂��͂��̑��̈����ɂ���Đ������؂�
 *  �����C���Q�C���̑��̋`���ɂ��ĉ���̐ӔC������Ȃ����̂Ƃ��܂��D
 */

# �z�肷��f�B���N�g���\��
#
#
# exampledir
# �b
# �� Makefile (this file)
# �b
# �� make_temp/ (temporary directory for make)
# �b
# ��  *.cpp
# �b
# �� source/
# �b  �b
# ��  �� *.cpp
# �b  �b
# �b  �� SubDir1
# ��      ��
# ��      �� *.cpp
# �b
# �� exe (executable file)

# .o: Objects file
# .d: Depends file

#=====================================================================================================================

# �\�[�X�t�@�C���̏ꏊ
# ��: SRCDIR = *.cpp source/*.cpp
SRCDIR = *.cpp source/*.cpp

# �����t�@�C����
TARGET = exe
# �e�f�B���N�g�����ɂ���ꍇ
# TARGET = $(shell basename `readlink -f .`).exe

# �R���p�C���I�v�V����
#CFLAGS  = -L/home/usr/lib -I/home/usr/include
CFLAGS += -Wall -O3

#=====================================================================================================================

SRCS   = $(wildcard $(SRCDIR))

TEMP_DIR = make_temp
OBJS     = $(addprefix $(TEMP_DIR)/, $(patsubst %.cpp, %.o, $(SRCS)))
#OBJS     = $(addprefix $(TEMP_DIR)/, $(SRCS:%.cpp=%.o))#�ʕ\�L

DEPS  = $(addprefix $(TEMP_DIR)/, $(patsubst %.cpp, %.d, $(SRCS)))
#DEPS  = $(addprefix $(TEMP_DIR)/, $(SRCS:%.cpp=%.d))#�ʕ\�L


# exe �t�@�C���̐���
$(TARGET): $(OBJS)
	@echo ""
	@echo "============================================================================================================"
	@echo ""

	@echo "SRCS: "
	@echo "$(SRCS)"
	@echo ""

	@echo "OBJS: "
	@echo "$(OBJS)"
	@echo ""

	@echo "CFLAGS: "
	@echo "$(CFLAGS)"
	@echo ""
	@echo "============================================================================================================"
	@echo ""
	$(CXX) -o $(TARGET) $(OBJS) $(CFLAGS)
	@echo ""

# �e�t�@�C���̕����R���p�C��
#
# $ mkdir -p make_temp/XXX/
# $ g++ *.cpp make_temp/XXX/*.o -Wall -O3
#
#        $<: *.cpp
# $(dir $@): make_temp/XXX/
#        $@: make_temp/XXX/*.o
#
$(TEMP_DIR)/%.o : %.cpp
	@echo ""
	mkdir -p $(dir $@); \
	$(CXX) $< -c -o $@ $(CFLAGS)


# �E�w�b�_�t�@�C���̈ˑ��֌W�������I�ɉ������� 
#
#
#	����: 
#			$(CXX) $< -MM $(CFLAGS)
#		->												myprint_o: source/myprint.cpp source/../include/myprint.hpp �𓾂�D
#
#	�o��: 
#			| sed 's/$(notdir $*).o/$(subst /,\/,$(patsubst %.d,%.o,$@) $@)/'
#		->	make_temp/source/myprint.o make_temp/source/myprint.d: source/myprint.cpp source/../include/myprint.hpp
#			����: myprint.o �� make_temp/source/myprint.o make_temp/source/myprint.d �ɒu��
#
#	����̏ڍ�: 
#			$*
#		->	source/myprint
#
#			$(notdir $*).o
#		->	myprint.o
#			����: �f�B���N�g���łȂ������̖��O��ԋp
#
#			$@
#		->	make_temp/source/myprint.d
#
#			$(patsubst %.d,%.o,$@)
#		->	make_temp/source/myprint.o
#			����: .d �� .o �ɒu��
#
#			$(patsubst %.d,%.o,$@) $@
#		->	make_temp/source/myprint.o make_temp/source/myprint.d
#
#			$(subst /,\/,$(patsubst %.d,%.o,$@) $@)
#		->	make_temp\/source\/myprint.o make_temp\/source\/myprint.d
#			����: / �� \/ �ɒu���D(sed �ɒl��n�����߂ɁC�G�X�P�[�v����)
#
#			| sed 's/$(notdir $*)\.o/$(subst /,\/,$(patsubst %.d,%.o,$@) $@)/'
#		->	make_temp/source/myprint.o make_temp/source/myprint.d: source/myprint.cpp source/../include/myprint.hpp
#			����: | (�p�C�v) �� $(CXX) $< -MM $(CFLAGS) �̏o�͂���͂Ƃ��Ď󂯎��D
#				  ���� myprint.o: source/myprint.cpp source/../include/myprint.hpp �́C
#				  myprint.o ���Cmake_temp/source/myprint.o make_temp/source/myprint.d �Œu������D
#
#			�����: 
#				�ŏ��ɏo�Ă��� aaaa �� bbbb �ɒu������D
#					$ echo "aaaa" | sed -e "s/aaaa/bbbb/"
#					bbbb
#
#				$ echo "myprint.o: source/myprint.cpp source/../include/myprint.hpp" | sed "s/myprint\.o/make_temp\/source\/myprint.o make_temp\/source\/myprint.d/"
#				make_temp/source/myprint.o make_temp/source/myprint.d: source/myprint.cpp source/../include/myprint.hpp
#
#				�Ƃ���ŁC���L�̂悤�ɁC[.] ���G�X�P�[�v���Ȃ��ƁC[.] �����K�\���ŔC�ӂ̈ꕶ����\���̂ŁC
#				myprint.o -> myprint_o �ƕύX���Ă����l�̏o�͂𓾂Ă��܂��D(���������āC��L�̂悤�� "\.o" �Ƃ��ăG�X�P�[�v����K�v������)
#				��:
#					$ echo "myprint_o: source/myprint.cpp source/../include/myprint.hpp" | sed "s/myprint.o/make_temp\/source\/myprint.o make_temp\/source\/myprint.d/"
#					make_temp/source/myprint.o make_temp/source/myprint.d: source/myprint.cpp source/../include/myprint.hpp

# �E�R���p�C�� (g++ -MM) �Ɏ��s���C��� .d �t�@�C�����������ꂽ�ꍇ�C���� .d �t�@�C�����폜����D
#
#	�t�@�C�����󂩂ǂ����𔻒肷��D
#		./example.txt �̃T�C�Y�� 0 �̎� empty ��\������D(0 �ȊO�̂Ƃ��C�Ȃɂ��\�����Ȃ�) || �́C�O�̃R�}���h�����s�����ꍇ�C��̃R�}���h�����s���閽�߁D
#		$ [ -s ./example.txt ]||echo "empty"

$(TEMP_DIR)/%.d : %.cpp
	@echo ""
	mkdir -p $(dir $@); \
	$(CXX) $< -MM $(CFLAGS) \
	| sed 's/$(notdir $*)\.o/$(subst /,\/,$(patsubst %.d,%.o,$@) $@)/' > $@ ; \
	[ -s $@ ] || rm -f $@
#	@echo $*	# for debug
#	@echo $@	# for debug

all: clean $(TARGET)

clean:
	-rm -rf $(TEMP_DIR) $(TARGET)
#	-rm -f $(OBJS) $(DEPS) $(TARGET)

onece:
	$(CXX) -o $(TARGET) $(SRCS) $(CFLAGS)

-include $(DEPS)



# ����
#
#
# gcc �R���p�C���I�v�V����
#	 -c: �\�[�X�E�t�@�C���̃R���p�C���A�܂��́A�A�Z���u�����s���܂����A�����N�͍s���܂���B
#		�����R���p�C������ۂɎg�p����D
#	 -M: .cpp �t�@�C�����C���N���[�h����t�@�C���𒲂ׂ�D(�V�X�e���t�@�C�����܂�    )
#	-MM: .cpp �t�@�C�����C���N���[�h����t�@�C���𒲂ׂ�D(�V�X�e���t�@�C�����܂܂Ȃ�)
#
#
# makefile ���̃R�}���h
#
#	$(addprefix PREFIX, NAMES...)
#		NAMES �̊e�v�f�̐ړ����Ƃ��� PREFIX ��ǉ�����B
#		�� -I �Ƃ���t����Ƃ��ȂǂɎg����B
#
#	$(patsubst PATTERN, REPLACEMENT, TEXT)
#		TEXT ������ PATTERN �Ƀ}�b�`�������̂� REPLACEMENT �ɒu��������B
#		�� subst �� PATTERN ���g����o�[�W�����B
#
#	$(subst FROM, TO, TEXT)
#		TEXT����FROM��TO�ɒu��������B
#		��patsubst��PATTERN���g���Ȃ��o�[�W�����B
#
#	$(dir $@)
#		$@ �̃f�B���N�g�������𒊏o
#
#	mkdir
#		-p: �w�肵���f�B���N�g�����T�u�f�B���N�g�����ƍ쐬����B
#		�c���[��̃f�B���N�g�����쐬�\
#
#	sed
#		$ file_name="linux.txt"
#		$ echo $file_name | sed -e "s/\.txt/.doc/"
#		linux.doc
#
#
# $@: $^
#	XXXXXX
#
#	$@: �^�[�Q�b�g��
#	$^: �ˑ��t�@�C���̃��X�g
#	$<: �ŏ��̈ˑ��t�@�C��
#	$%: �^�[�Q�b�g���A�[�J�C�u�����o�������Ƃ��̃^�[�Q�b�g�����o��
#	$?: �^�[�Q�b�g���V�������ׂĂ̈ˑ�����t�@�C����
#	$+: Makefile�Ɠ������Ԃ̈ˑ�����t�@�C���̖��O
#	$*: �T�t�B�b�N�X���������^�[�Q�b�g�̖��O
#
#
# shell script
#
#	 &: ������s
#	 ;: �������s
#	 \: ���s�����R�}���h�̐ڑ�
#	 |: �p�C�v�D�O�̃R�}���h�̕W���o�͂��C��̃R�}���h�̕W�����͂Ƃ���D
#	||: �O�̃R�}���h�����s�����ꍇ�C��̃R�}���h�����s����D
#	&&: �O�̃R�}���h�����������ꍇ�C��̃R�}���h�����s����D
#	 >: �W���o�͂��t�@�C���ɏo�͂���D���łɃt�@�C��������ꍇ�͏㏑������D
#
#	�Q�l����: 
#		[1] Makefile �ʃf�B���N�g���ɒ��ԃt�@�C�� & �����ˑ��֌W�ݒ� _ �d�]����: http://d-rissoku.net/2013/06/makefile-%E5%88%A5%E3%83%87%E3%82%A3%E3%83%AC%E3%82%AF%E3%83%88%E3%83%AA%E3%81%AB%E4%B8%AD%E9%96%93%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB-%E8%87%AA%E5%8B%95%E4%BE%9D%E5%AD%98%E9%96%A2%E4%BF%82/
#		[2] Makefile�Ń��C���h�J�[�h���g�����@ - nao-bamboo�̓��L: http://tech.chocolatoon.com/entry/2015/09/11/175832
#		[3] Makefile�̊֐� - Qiita: http://qiita.com/chibi929/items/b8c5f36434d5d3fbfa4a
#		[4] Make�Ńw�b�_�t�@�C���̈ˑ��֌W�ɑΉ�����: http://blog.wagavulin.jp/entry/20120405/1333629926
#		[5] �V���v���ŉ��p�̌���makefile�Ƃ��̉�� - URIN HACK: http://urin.github.io/posts/2013/simple-makefile-for-clang/
#
#		[6] �V�F���̏����̏���: http://www.onetwo.jp/proginfo/pub/unix/sh.htm
#		[7] sed�R�}���h�̔��Y�^ - Qiita: http://qiita.com/takech9203/items/b96eff5773ce9d9cc9b3
#
#		[8] �f�B���N�g���\���}�������Ƃ��ɕ֗��ȋL�� - Qiita: http://qiita.com/paty-fakename/items/c82ed27b4070feeceff6
