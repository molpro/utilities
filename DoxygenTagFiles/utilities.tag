<?xml version='1.0' encoding='UTF-8' standalone='yes' ?>
<tagfile doxygen_version="1.15.0">
  <compound kind="file">
    <name>README.md</name>
    <path>/__w/utilities/utilities/</path>
    <filename>README_8md.html</filename>
  </compound>
  <compound kind="file">
    <name>bytestreamC.cpp</name>
    <path>/__w/utilities/utilities/src/molpro/</path>
    <filename>bytestreamC_8cpp.html</filename>
    <includes id="bytestreamC_8h" name="bytestreamC.h" local="yes" import="no" module="no" objc="no">bytestreamC.h</includes>
    <includes id="iostream_8h" name="iostream.h" local="no" import="no" module="no" objc="no">molpro/iostream.h</includes>
    <class kind="class">bytestream</class>
    <member kind="typedef">
      <type>int32_t</type>
      <name>fint</name>
      <anchorfile>bytestreamC_8cpp.html</anchorfile>
      <anchor>a966c08c826366d2c898fbfa573d43699</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>memory_bytestream_hash</name>
      <anchorfile>bytestreamC_8cpp.html</anchorfile>
      <anchor>a6a2bee24d702e1fc509e77c9807e63e4</anchor>
      <arglist>(const char *s, size_t n)</arglist>
    </member>
    <member kind="variable">
      <type>bool</type>
      <name>debug_bytestream</name>
      <anchorfile>bytestreamC_8cpp.html</anchorfile>
      <anchor>a30e014de7f0acf5f87495bc217cd9fd4</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>bytestreamC.h</name>
    <path>/__w/utilities/utilities/src/molpro/</path>
    <filename>bytestreamC_8h.html</filename>
    <includes id="memory_8h" name="memory.h" local="no" import="no" module="no" objc="no">molpro/memory.h</includes>
    <class kind="class">molpro::bytestream</class>
    <namespace>molpro</namespace>
    <member kind="function">
      <type>size_t</type>
      <name>memory_bytestream_hash</name>
      <anchorfile>bytestreamC_8h.html</anchorfile>
      <anchor>a6a2bee24d702e1fc509e77c9807e63e4</anchor>
      <arglist>(const char *s, size_t n)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>cblas.h</name>
    <path>/__w/utilities/utilities/src/molpro/</path>
    <filename>cblas_8h.html</filename>
    <member kind="define">
      <type>#define</type>
      <name>HAVE_CBLAS</name>
      <anchorfile>cblas_8h.html</anchorfile>
      <anchor>a44285e5a3f17af0a5dc5b22de44805be</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>iostream.h</name>
    <path>/__w/utilities/utilities/src/molpro/</path>
    <filename>iostream_8h.html</filename>
    <namespace>molpro</namespace>
  </compound>
  <compound kind="file">
    <name>lapacke.h</name>
    <path>/__w/utilities/utilities/src/molpro/</path>
    <filename>lapacke_8h.html</filename>
  </compound>
  <compound kind="file">
    <name>memory.h</name>
    <path>/__w/utilities/utilities/src/molpro/</path>
    <filename>memory_8h.html</filename>
    <includes id="memory-config_8h" name="memory-config.h" local="no" import="no" module="no" objc="no">molpro/memory/memory-config.h</includes>
    <class kind="struct">molpro::_EmptyBase_</class>
    <class kind="class">molpro::allocator_</class>
    <class kind="class">molpro::pointer_holder</class>
    <class kind="class">molpro::vector</class>
    <class kind="class">molpro::vector::MyIterator</class>
    <class kind="class">molpro::array</class>
    <class kind="class">molpro::array::MyIterator</class>
    <namespace>molpro</namespace>
    <namespace>molpro::memory</namespace>
    <namespace>molpro::memory::detail</namespace>
    <member kind="function">
      <type>size_t</type>
      <name>memory_initialize</name>
      <anchorfile>memory_8h.html</anchorfile>
      <anchor>a17843591b3971a2603f88bd29f56e057</anchor>
      <arglist>(char *buffer, size_t max)</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>memory_used</name>
      <anchorfile>memory_8h.html</anchorfile>
      <anchor>a16d130acad323a8963144efdb8d865dd</anchor>
      <arglist>(int maximum=0)</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>memory_remaining</name>
      <anchorfile>memory_8h.html</anchorfile>
      <anchor>ab6dc83a79e362f9370c8726259d24d8a</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>memory_print_status</name>
      <anchorfile>memory_8h.html</anchorfile>
      <anchor>a963f09ca1733fb5608eabb11d2b8de91</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>memory_reset_maximum_stack</name>
      <anchorfile>memory_8h.html</anchorfile>
      <anchor>ad0e4375eab3f07c5ea41d1a155e1f659</anchor>
      <arglist>(int64_t level)</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>memoryC.cpp</name>
    <path>/__w/utilities/utilities/src/molpro/</path>
    <filename>memoryC_8cpp.html</filename>
    <includes id="memory_8h" name="memory.h" local="yes" import="no" module="no" objc="no">memory.h</includes>
    <namespace>molpro</namespace>
    <namespace>molpro::memory</namespace>
    <namespace>molpro::memory::detail</namespace>
  </compound>
  <compound kind="file">
    <name>mpi.h</name>
    <path>/__w/utilities/utilities/src/molpro/</path>
    <filename>mpi_8h.html</filename>
    <namespace>molpro</namespace>
    <namespace>molpro::mpi</namespace>
    <member kind="function">
      <type>int64_t</type>
      <name>mpicomm_global</name>
      <anchorfile>mpi_8h.html</anchorfile>
      <anchor>a2daa4c7716d30a22a68043f1b164af1b</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>int64_t</type>
      <name>mpicomm_self</name>
      <anchorfile>mpi_8h.html</anchorfile>
      <anchor>a6b89f818e883d10d057515d82d01b8ae</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>int64_t</type>
      <name>mpisize_global</name>
      <anchorfile>mpi_8h.html</anchorfile>
      <anchor>a79b1ba490cf104bd1bd4da185a1849cc</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>int64_t</type>
      <name>mpirank_global</name>
      <anchorfile>mpi_8h.html</anchorfile>
      <anchor>a7c4d532cbe9deb7c3184e5e40989c326</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>mpi_init</name>
      <anchorfile>mpi_8h.html</anchorfile>
      <anchor>a5f048f4250b440aef235f80d950d2818</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>mpi_finalize</name>
      <anchorfile>mpi_8h.html</anchorfile>
      <anchor>aa71ad85cbc175e31bc1792e401e417f9</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>Options.cpp</name>
    <path>/__w/utilities/utilities/src/molpro/</path>
    <filename>Options_8cpp.html</filename>
    <includes id="Options_8h" name="Options.h" local="yes" import="no" module="no" objc="no">Options.h</includes>
    <namespace>molpro</namespace>
    <member kind="define">
      <type>#define</type>
      <name>_GNU_SOURCE</name>
      <anchorfile>Options_8cpp.html</anchorfile>
      <anchor>a369266c24eacffb87046522897a570d5</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="file">
    <name>Options.h</name>
    <path>/__w/utilities/utilities/src/molpro/</path>
    <filename>Options_8h.html</filename>
    <class kind="class">molpro::Options</class>
    <namespace>molpro</namespace>
  </compound>
  <compound kind="file">
    <name>memory-config.h</name>
    <path>/home/runner/work/utilities/utilities/build/src/molpro/memory/</path>
    <filename>memory-config_8h.html</filename>
  </compound>
  <compound kind="struct">
    <name>molpro::_EmptyBase_</name>
    <filename>structmolpro_1_1__EmptyBase__.html</filename>
  </compound>
  <compound kind="class">
    <name>molpro::allocator_</name>
    <filename>classmolpro_1_1allocator__.html</filename>
    <templarg>typename T</templarg>
    <templarg>typename A</templarg>
    <base>molpro::_EmptyBase_</base>
    <member kind="typedef">
      <type>T</type>
      <name>value_type</name>
      <anchorfile>classmolpro_1_1allocator__.html</anchorfile>
      <anchor>a053fd7bec95dba6bb5ed37dd88619807</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>allocator_</name>
      <anchorfile>classmolpro_1_1allocator__.html</anchorfile>
      <anchor>a06ff0cc67d7b78c3b0324aae0220a817</anchor>
      <arglist>() noexcept=default</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>allocator_</name>
      <anchorfile>classmolpro_1_1allocator__.html</anchorfile>
      <anchor>a442a2a7d4cf50df578ddc85e3ca06533</anchor>
      <arglist>(const allocator_ &amp;) noexcept=default</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>allocator_</name>
      <anchorfile>classmolpro_1_1allocator__.html</anchorfile>
      <anchor>a66c7754fc20dba4266078def9c824609</anchor>
      <arglist>(allocator_ &amp;&amp;) noexcept=default</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>allocator_</name>
      <anchorfile>classmolpro_1_1allocator__.html</anchorfile>
      <anchor>a8023312387533b2165d9f5e648639456</anchor>
      <arglist>(const allocator_&lt; U &gt; &amp;other) noexcept</arglist>
    </member>
    <member kind="function">
      <type>T *</type>
      <name>allocate</name>
      <anchorfile>classmolpro_1_1allocator__.html</anchorfile>
      <anchor>ab71d100edbd6e6c6cc582b0128f1c25b</anchor>
      <arglist>(std::size_t cnt)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>deallocate</name>
      <anchorfile>classmolpro_1_1allocator__.html</anchorfile>
      <anchor>abd7bea8c6fa6800268f029b466f69d09</anchor>
      <arglist>(T *p, std::size_t)</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>operator==</name>
      <anchorfile>classmolpro_1_1allocator__.html</anchorfile>
      <anchor>aa960c1c4b967a4a6b739691bdad055de</anchor>
      <arglist>(allocator_ const &amp;) const</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>operator!=</name>
      <anchorfile>classmolpro_1_1allocator__.html</anchorfile>
      <anchor>a0ac1b9ff84eee1285d0353fdfdf3ac09</anchor>
      <arglist>(allocator_ const &amp;a) const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::array</name>
    <filename>classmolpro_1_1array.html</filename>
    <templarg>typename T</templarg>
    <class kind="class">molpro::array::MyIterator</class>
    <member kind="typedef">
      <type>MyIterator&lt; false &gt;</type>
      <name>Iterator</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>ab86ecec09637202a0a53ab5274baab98</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>MyIterator&lt; true &gt;</type>
      <name>ConstIterator</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>a1a70fe93eac8174b296a3c565d8b56bf</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>Iterator</type>
      <name>iterator</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>a923b7a903fd3b8c69056d41931950f0a</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>ConstIterator</type>
      <name>const_iterator</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>a988d44a2a9993b6cba41e6308a156f8c</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::reverse_iterator&lt; Iterator &gt;</type>
      <name>reverse_iterator</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>a18ed223f96ddbccd3778734a404ce890</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::reverse_iterator&lt; ConstIterator &gt;</type>
      <name>const_reverse_iterator</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>a46422bd3aef4c980965e56caa05f481c</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>array</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>aaf6614e1af10de14bf51d5366619241c</anchor>
      <arglist>(size_t const length=0)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>array</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>adb956cd959aa04ec6f2cede193e9760d</anchor>
      <arglist>(size_t const length, const T &amp;value)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>array</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>abc1e8d9abf5880a22f9c1dd2f31ca54a</anchor>
      <arglist>(InputIterator first, InputIterator last)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>array</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>a7aa2c108e3e0dc71054cdc2735faf0f8</anchor>
      <arglist>(std::initializer_list&lt; T &gt; il)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>array</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>a8a351d76e3a65df079e23b8cbfe66f7e</anchor>
      <arglist>(T *const buffer, size_t const length)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>array</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>ae9d2c5f49b8cf32ed8f95ac0e255f8ca</anchor>
      <arglist>(std::array&lt; T, N &gt; &amp;source)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>array</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>a53ec9dd383377307296b458c8c8a231f</anchor>
      <arglist>(std::vector&lt; T &gt; &amp;source)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>array</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>ab3a79fc7b590a6c52c797b76a74b55b9</anchor>
      <arglist>(const array &amp;source)</arglist>
    </member>
    <member kind="function">
      <type>array &amp;</type>
      <name>operator=</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>a5601c4f1e0e9b78ca0d1545dba6611a0</anchor>
      <arglist>(const array &amp;copy)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~array</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>a4344f13ec746e24835d4db2edff453b7</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>T &amp;</type>
      <name>operator[]</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>a645d59e4120467ac321ab8c1aabc1fe6</anchor>
      <arglist>(size_t n)</arglist>
    </member>
    <member kind="function">
      <type>const T &amp;</type>
      <name>operator[]</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>a98c11cabac3e26009d313fbf8c943b8a</anchor>
      <arglist>(size_t n) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>assign</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>a1a15530987d95836fb9e3b3fcb04b71a</anchor>
      <arglist>(InputIterator first, InputIterator last)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>assign</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>a7a7fc0e87251a3bc3e475ef123e1fd6e</anchor>
      <arglist>(const T &amp;value)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>assign</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>a95c9ba629710dd491ed264b9e68f9093</anchor>
      <arglist>(size_t n, const T &amp;value)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>assign</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>aad983a8bf6a8cd03508bb113e53c9284</anchor>
      <arglist>(std::initializer_list&lt; T &gt; il)</arglist>
    </member>
    <member kind="function">
      <type>T &amp;</type>
      <name>at</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>a4342410e4502c30cb9e648b6b0a7fe81</anchor>
      <arglist>(size_t n)</arglist>
    </member>
    <member kind="function">
      <type>const T &amp;</type>
      <name>at</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>a4ed2495b6590326c8195a70622155890</anchor>
      <arglist>(size_t n) const</arglist>
    </member>
    <member kind="function">
      <type>T &amp;</type>
      <name>back</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>a9e52ad18160ad4d01fd30fb1002c68f3</anchor>
      <arglist>() noexcept</arglist>
    </member>
    <member kind="function">
      <type>const T &amp;</type>
      <name>back</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>a6e1ca1bddc7c9a4ff193d371a1dfd4f7</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>empty</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>ac37f9f4db00ede4ea64edc8dac46175a</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>T &amp;</type>
      <name>front</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>ae2aa1ff90b6ea127d9999917c5d47940</anchor>
      <arglist>() noexcept</arglist>
    </member>
    <member kind="function">
      <type>const T &amp;</type>
      <name>front</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>aac9c7cbf6a7a024b436c6cc4364194b6</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>T *</type>
      <name>data</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>afbe68a6a83aa7ebcc8f3ba99e47d38fa</anchor>
      <arglist>() noexcept</arglist>
    </member>
    <member kind="function">
      <type>const T *</type>
      <name>data</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>a792a341be28d6d313692ca148e62d34d</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>max_size</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>afdc58fde532c1362469af1a7331c528c</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>size</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>a4fea0e56fbfa8d9695badbe95fa3501a</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>swap</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>ab6c8a8c20bdc5b57fb0339ddf979e6fd</anchor>
      <arglist>(array&lt; T &gt; &amp;x) noexcept</arglist>
    </member>
    <member kind="function">
      <type>iterator</type>
      <name>begin</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>a0807b80d316f8b21db9c64a44eb4152d</anchor>
      <arglist>() noexcept</arglist>
    </member>
    <member kind="function">
      <type>const_iterator</type>
      <name>begin</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>a258bdc7e63435f18bcc3ca7b653fb68e</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>const_iterator</type>
      <name>cbegin</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>a6f5d6739ae604e54910f4e19433f7aab</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>iterator</type>
      <name>end</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>a7b9635b131a90da75019d8e5d9587600</anchor>
      <arglist>() noexcept</arglist>
    </member>
    <member kind="function">
      <type>const_iterator</type>
      <name>end</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>a52fb7329d4009f87d399331224b61fcd</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>const_iterator</type>
      <name>cend</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>a0e2203f477f32e4ec62dbfd85ded78dd</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>reverse_iterator</type>
      <name>rbegin</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>a38d40d516f50b0978f19ff73e61b0bb4</anchor>
      <arglist>() noexcept</arglist>
    </member>
    <member kind="function">
      <type>const_reverse_iterator</type>
      <name>rbegin</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>ab286dd12aa29e942acc98dced3ddded8</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>const_reverse_iterator</type>
      <name>crbegin</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>ab71630b99d5252da2dd105424e7d94c0</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>reverse_iterator</type>
      <name>rend</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>a885d7fcc040a3f71880098024d38cb72</anchor>
      <arglist>() noexcept</arglist>
    </member>
    <member kind="function">
      <type>const_reverse_iterator</type>
      <name>rend</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>aee794c1b00d6e76d7afb3c3cd685cd90</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>const_reverse_iterator</type>
      <name>crend</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>a122faaab9a23648ed6f97b1c110d5e62</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>str</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>a372ca876427f1789ae9f98276f7083e1</anchor>
      <arglist>(int verbosity=1, unsigned int columns=UINT_MAX) const</arglist>
    </member>
    <member kind="friend">
      <type>friend void</type>
      <name>swap</name>
      <anchorfile>classmolpro_1_1array.html</anchorfile>
      <anchor>a097c4790e97742cf5cd0d0da4a8555d6</anchor>
      <arglist>(array&lt; T &gt; &amp;a, array&lt; T &gt; &amp;b) noexcept</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>bytestream</name>
    <filename>classbytestream.html</filename>
    <member kind="function">
      <type></type>
      <name>bytestream</name>
      <anchorfile>classbytestream.html</anchorfile>
      <anchor>aa3ce3e4f5071835ee0fc203a6e6c15c8</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>bytestream</name>
      <anchorfile>classbytestream.html</anchorfile>
      <anchor>a1ce99e37c0c901fdfeddaa8aef501a04</anchor>
      <arglist>(const char *buffer)</arglist>
    </member>
    <member kind="function">
      <type>molpro::array&lt; double &gt;</type>
      <name>doubles</name>
      <anchorfile>classbytestream.html</anchorfile>
      <anchor>acffa7ce56f0f8fe82e06bfa02bcb91fc</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>molpro::array&lt; fint &gt;</type>
      <name>ints</name>
      <anchorfile>classbytestream.html</anchorfile>
      <anchor>a2116269c05f58d62746ffb5bb151521d</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>molpro::array&lt; char &gt;</type>
      <name>chars</name>
      <anchorfile>classbytestream.html</anchorfile>
      <anchor>a6adf3f3e7dc1f952f0ab6ac9a7344a11</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bytestream</type>
      <name>byteStream</name>
      <anchorfile>classbytestream.html</anchorfile>
      <anchor>a38e9cd3e7aa464105d69887f4b56ecc9</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>reset</name>
      <anchorfile>classbytestream.html</anchorfile>
      <anchor>a8a06348759d5d39195c3bea8839598d2</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>append</name>
      <anchorfile>classbytestream.html</anchorfile>
      <anchor>ac83482d8f93efd332a25415619bb5f54</anchor>
      <arglist>(const double *array, size_t length=1)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>append</name>
      <anchorfile>classbytestream.html</anchorfile>
      <anchor>a59c9080da6c288af288ae27234972b05</anchor>
      <arglist>(const fint *array, size_t length=1)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>append</name>
      <anchorfile>classbytestream.html</anchorfile>
      <anchor>ac18a1ae610ed92deb811a4e2df514b86</anchor>
      <arglist>(const char *array, size_t length=1)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>append</name>
      <anchorfile>classbytestream.html</anchorfile>
      <anchor>ae15d4457b65d22bcfa5d6fb6dc73d349</anchor>
      <arglist>(const bytestream &amp;bs)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>append</name>
      <anchorfile>classbytestream.html</anchorfile>
      <anchor>a832ac257c555ca62502781a7776270c7</anchor>
      <arglist>(size_t i)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>append</name>
      <anchorfile>classbytestream.html</anchorfile>
      <anchor>ac4b675e3181e3e588cef0c9db26f5db7</anchor>
      <arglist>(const T *array, size_t length=1)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>append</name>
      <anchorfile>classbytestream.html</anchorfile>
      <anchor>adfc0248b8f95707bf796c676a40968bd</anchor>
      <arglist>(const std::vector&lt; T &gt; &amp;array)</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>size</name>
      <anchorfile>classbytestream.html</anchorfile>
      <anchor>a9339728da9a0b2fc8efe3e866c6b76a5</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>position</name>
      <anchorfile>classbytestream.html</anchorfile>
      <anchor>a5270ea6551237f711bcdb252dea5f3ce</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>const std::vector&lt; char &gt; &amp;</type>
      <name>data</name>
      <anchorfile>classbytestream.html</anchorfile>
      <anchor>a0a246cbf575ce15ec3d210cd4febb1c9</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>dump</name>
      <anchorfile>classbytestream.html</anchorfile>
      <anchor>aba1a2f2755311fb9a063852a9527a8b7</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>hash</name>
      <anchorfile>classbytestream.html</anchorfile>
      <anchor>a78ec1c40faa1e9e6e7e1d9390cb445ff</anchor>
      <arglist>() const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::bytestream</name>
    <filename>classmolpro_1_1bytestream.html</filename>
    <member kind="function">
      <type></type>
      <name>bytestream</name>
      <anchorfile>classmolpro_1_1bytestream.html</anchorfile>
      <anchor>aa3ce3e4f5071835ee0fc203a6e6c15c8</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>bytestream</name>
      <anchorfile>classmolpro_1_1bytestream.html</anchorfile>
      <anchor>a1ce99e37c0c901fdfeddaa8aef501a04</anchor>
      <arglist>(const char *buffer)</arglist>
    </member>
    <member kind="function">
      <type>molpro::array&lt; double &gt;</type>
      <name>doubles</name>
      <anchorfile>classmolpro_1_1bytestream.html</anchorfile>
      <anchor>acffa7ce56f0f8fe82e06bfa02bcb91fc</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>molpro::array&lt; fint &gt;</type>
      <name>ints</name>
      <anchorfile>classmolpro_1_1bytestream.html</anchorfile>
      <anchor>a2116269c05f58d62746ffb5bb151521d</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>molpro::array&lt; char &gt;</type>
      <name>chars</name>
      <anchorfile>classmolpro_1_1bytestream.html</anchorfile>
      <anchor>a6adf3f3e7dc1f952f0ab6ac9a7344a11</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>bytestream</type>
      <name>byteStream</name>
      <anchorfile>classmolpro_1_1bytestream.html</anchorfile>
      <anchor>a38e9cd3e7aa464105d69887f4b56ecc9</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>reset</name>
      <anchorfile>classmolpro_1_1bytestream.html</anchorfile>
      <anchor>a8a06348759d5d39195c3bea8839598d2</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>append</name>
      <anchorfile>classmolpro_1_1bytestream.html</anchorfile>
      <anchor>ac83482d8f93efd332a25415619bb5f54</anchor>
      <arglist>(const double *array, size_t length=1)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>append</name>
      <anchorfile>classmolpro_1_1bytestream.html</anchorfile>
      <anchor>a59c9080da6c288af288ae27234972b05</anchor>
      <arglist>(const fint *array, size_t length=1)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>append</name>
      <anchorfile>classmolpro_1_1bytestream.html</anchorfile>
      <anchor>ac18a1ae610ed92deb811a4e2df514b86</anchor>
      <arglist>(const char *array, size_t length=1)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>append</name>
      <anchorfile>classmolpro_1_1bytestream.html</anchorfile>
      <anchor>ae15d4457b65d22bcfa5d6fb6dc73d349</anchor>
      <arglist>(const bytestream &amp;bs)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>append</name>
      <anchorfile>classmolpro_1_1bytestream.html</anchorfile>
      <anchor>a832ac257c555ca62502781a7776270c7</anchor>
      <arglist>(size_t i)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>append</name>
      <anchorfile>classmolpro_1_1bytestream.html</anchorfile>
      <anchor>ac4b675e3181e3e588cef0c9db26f5db7</anchor>
      <arglist>(const T *array, size_t length=1)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>append</name>
      <anchorfile>classmolpro_1_1bytestream.html</anchorfile>
      <anchor>adfc0248b8f95707bf796c676a40968bd</anchor>
      <arglist>(const std::vector&lt; T &gt; &amp;array)</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>size</name>
      <anchorfile>classmolpro_1_1bytestream.html</anchorfile>
      <anchor>a9339728da9a0b2fc8efe3e866c6b76a5</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>position</name>
      <anchorfile>classmolpro_1_1bytestream.html</anchorfile>
      <anchor>a5270ea6551237f711bcdb252dea5f3ce</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>const std::vector&lt; char &gt; &amp;</type>
      <name>data</name>
      <anchorfile>classmolpro_1_1bytestream.html</anchorfile>
      <anchor>a0a246cbf575ce15ec3d210cd4febb1c9</anchor>
      <arglist>() const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>dump</name>
      <anchorfile>classmolpro_1_1bytestream.html</anchorfile>
      <anchor>aba1a2f2755311fb9a063852a9527a8b7</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>hash</name>
      <anchorfile>classmolpro_1_1bytestream.html</anchorfile>
      <anchor>a78ec1c40faa1e9e6e7e1d9390cb445ff</anchor>
      <arglist>() const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::array::MyIterator</name>
    <filename>classmolpro_1_1array_1_1MyIterator.html</filename>
    <templarg>bool IsConst</templarg>
    <member kind="typedef">
      <type>std::random_access_iterator_tag</type>
      <name>iterator_category</name>
      <anchorfile>classmolpro_1_1array_1_1MyIterator.html</anchorfile>
      <anchor>aae1140699c8649311cb710c4ab0fcb4c</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>T</type>
      <name>value_type</name>
      <anchorfile>classmolpro_1_1array_1_1MyIterator.html</anchorfile>
      <anchor>a98e4cd11a3f777d76b7cc33203f8f995</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::ptrdiff_t</type>
      <name>difference_type</name>
      <anchorfile>classmolpro_1_1array_1_1MyIterator.html</anchorfile>
      <anchor>ab312c79c84ff48d41cedc8077aa23845</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>T *</type>
      <name>pointer</name>
      <anchorfile>classmolpro_1_1array_1_1MyIterator.html</anchorfile>
      <anchor>a9143a255fd918a354fda2620a9dd8cea</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>T &amp;</type>
      <name>reference</name>
      <anchorfile>classmolpro_1_1array_1_1MyIterator.html</anchorfile>
      <anchor>a4f66a03bec5061784243cee374cd8107</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>MyIterator</name>
      <anchorfile>classmolpro_1_1array_1_1MyIterator.html</anchorfile>
      <anchor>aae31476a8b3d6f400fc03fccb81db266</anchor>
      <arglist>() noexcept</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>MyIterator</name>
      <anchorfile>classmolpro_1_1array_1_1MyIterator.html</anchorfile>
      <anchor>aa9c31f1f4c9ad0caba8bf0a66dcdfaf7</anchor>
      <arglist>(pointer ptr)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>MyIterator</name>
      <anchorfile>classmolpro_1_1array_1_1MyIterator.html</anchorfile>
      <anchor>ac9cc1448b9fbb1e4df547a565d9f417f</anchor>
      <arglist>(const MyIterator &amp;)=default</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>MyIterator</name>
      <anchorfile>classmolpro_1_1array_1_1MyIterator.html</anchorfile>
      <anchor>aa840a184e2be84a80170f5e94ad6266d</anchor>
      <arglist>(const MyIterator&lt; false &gt; &amp;rhs)</arglist>
    </member>
    <member kind="function">
      <type>reference</type>
      <name>operator*</name>
      <anchorfile>classmolpro_1_1array_1_1MyIterator.html</anchorfile>
      <anchor>aa87f60abdb97c3143430db1be55244a8</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>pointer</type>
      <name>operator-&gt;</name>
      <anchorfile>classmolpro_1_1array_1_1MyIterator.html</anchorfile>
      <anchor>a9f9926abe7f143da6db11f649ad8dc1a</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>MyIterator &amp;</type>
      <name>operator++</name>
      <anchorfile>classmolpro_1_1array_1_1MyIterator.html</anchorfile>
      <anchor>aabebf20852c9380de44602757deea3a3</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>MyIterator</type>
      <name>operator++</name>
      <anchorfile>classmolpro_1_1array_1_1MyIterator.html</anchorfile>
      <anchor>a365cf12ebbb25429ab237225e009a378</anchor>
      <arglist>(int)</arglist>
    </member>
    <member kind="function">
      <type>MyIterator &amp;</type>
      <name>operator--</name>
      <anchorfile>classmolpro_1_1array_1_1MyIterator.html</anchorfile>
      <anchor>a13db39637fa898d1c5f7237a320c215a</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>MyIterator</type>
      <name>operator--</name>
      <anchorfile>classmolpro_1_1array_1_1MyIterator.html</anchorfile>
      <anchor>ae65e8caffc39057168e7e07615146646</anchor>
      <arglist>(int)</arglist>
    </member>
    <member kind="function">
      <type>MyIterator &amp;</type>
      <name>operator+=</name>
      <anchorfile>classmolpro_1_1array_1_1MyIterator.html</anchorfile>
      <anchor>ada82ab37771f889968439361b4bb937b</anchor>
      <arglist>(difference_type n)</arglist>
    </member>
    <member kind="function">
      <type>MyIterator &amp;</type>
      <name>operator-=</name>
      <anchorfile>classmolpro_1_1array_1_1MyIterator.html</anchorfile>
      <anchor>aca4b8684b5ffad73daab86b8333cb45b</anchor>
      <arglist>(difference_type n)</arglist>
    </member>
    <member kind="function">
      <type>MyIterator</type>
      <name>operator+</name>
      <anchorfile>classmolpro_1_1array_1_1MyIterator.html</anchorfile>
      <anchor>a481ae7af6a43e414d4d9622bcfdd85ae</anchor>
      <arglist>(difference_type n) const</arglist>
    </member>
    <member kind="function">
      <type>MyIterator</type>
      <name>operator-</name>
      <anchorfile>classmolpro_1_1array_1_1MyIterator.html</anchorfile>
      <anchor>a2cabc644b6bd4e9f4d78bc4e00e5f602</anchor>
      <arglist>(difference_type n) const</arglist>
    </member>
    <member kind="function">
      <type>difference_type</type>
      <name>operator-</name>
      <anchorfile>classmolpro_1_1array_1_1MyIterator.html</anchorfile>
      <anchor>a0d6fb6bff227eb465266b2d062e3a454</anchor>
      <arglist>(const MyIterator &amp;rhs) const</arglist>
    </member>
    <member kind="function">
      <type>value_type &amp;</type>
      <name>operator[]</name>
      <anchorfile>classmolpro_1_1array_1_1MyIterator.html</anchorfile>
      <anchor>a148cc493793df65ec77bf6527e3047fb</anchor>
      <arglist>(difference_type n) const</arglist>
    </member>
    <member kind="variable" protection="protected">
      <type>pointer</type>
      <name>m_ptr</name>
      <anchorfile>classmolpro_1_1array_1_1MyIterator.html</anchorfile>
      <anchor>a72610b31739129f6d074e7fdd7110e8d</anchor>
      <arglist></arglist>
    </member>
    <member kind="friend">
      <type>friend class</type>
      <name>MyIterator&lt; true &gt;</name>
      <anchorfile>classmolpro_1_1array_1_1MyIterator.html</anchorfile>
      <anchor>aa994fbfa2f35113829261b203072388a</anchor>
      <arglist></arglist>
    </member>
    <member kind="friend">
      <type>friend class</type>
      <name>MyIterator&lt; false &gt;</name>
      <anchorfile>classmolpro_1_1array_1_1MyIterator.html</anchorfile>
      <anchor>ac223f0f27ba0955878dd8100332c3c53</anchor>
      <arglist></arglist>
    </member>
    <member kind="friend">
      <type>friend MyIterator</type>
      <name>operator+</name>
      <anchorfile>classmolpro_1_1array_1_1MyIterator.html</anchorfile>
      <anchor>af7c34b09ca9b818939012ec2a54cfef9</anchor>
      <arglist>(difference_type n, const MyIterator &amp;rhs)</arglist>
    </member>
    <member kind="friend">
      <type>friend MyIterator</type>
      <name>operator-</name>
      <anchorfile>classmolpro_1_1array_1_1MyIterator.html</anchorfile>
      <anchor>af9ddcdffd9c8207a0f20aacb86810337</anchor>
      <arglist>(difference_type n, const MyIterator &amp;rhs)</arglist>
    </member>
    <member kind="friend">
      <type>friend bool</type>
      <name>operator==</name>
      <anchorfile>classmolpro_1_1array_1_1MyIterator.html</anchorfile>
      <anchor>ab3184c5b2ee73e8c248e90212c447823</anchor>
      <arglist>(const MyIterator &amp;lhs, const MyIterator &amp;rhs)</arglist>
    </member>
    <member kind="friend">
      <type>friend bool</type>
      <name>operator!=</name>
      <anchorfile>classmolpro_1_1array_1_1MyIterator.html</anchorfile>
      <anchor>ac20abf02b27483d2a95b2e5e6e50255b</anchor>
      <arglist>(const MyIterator &amp;lhs, const MyIterator &amp;rhs)</arglist>
    </member>
    <member kind="friend">
      <type>friend bool</type>
      <name>operator&lt;</name>
      <anchorfile>classmolpro_1_1array_1_1MyIterator.html</anchorfile>
      <anchor>ae3199281f4d5b5b46c242ca3d5347564</anchor>
      <arglist>(const MyIterator &amp;lhs, const MyIterator &amp;rhs)</arglist>
    </member>
    <member kind="friend">
      <type>friend bool</type>
      <name>operator&gt;</name>
      <anchorfile>classmolpro_1_1array_1_1MyIterator.html</anchorfile>
      <anchor>a542f86c229f7cca49fd98e1159055044</anchor>
      <arglist>(const MyIterator &amp;lhs, const MyIterator &amp;rhs)</arglist>
    </member>
    <member kind="friend">
      <type>friend bool</type>
      <name>operator&lt;=</name>
      <anchorfile>classmolpro_1_1array_1_1MyIterator.html</anchorfile>
      <anchor>a4335d6a63b8709b430688fd9a288ce47</anchor>
      <arglist>(const MyIterator &amp;lhs, const MyIterator &amp;rhs)</arglist>
    </member>
    <member kind="friend">
      <type>friend bool</type>
      <name>operator&gt;=</name>
      <anchorfile>classmolpro_1_1array_1_1MyIterator.html</anchorfile>
      <anchor>a979457ed52a3a7eef09ecf9094b124c7</anchor>
      <arglist>(const MyIterator &amp;lhs, const MyIterator &amp;rhs)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::vector::MyIterator</name>
    <filename>classmolpro_1_1vector_1_1MyIterator.html</filename>
    <templarg>bool IsConst</templarg>
    <base>molpro::pointer_holder&lt; T, _Alloc &gt;</base>
    <member kind="typedef">
      <type>std::bidirectional_iterator_tag</type>
      <name>iterator_category</name>
      <anchorfile>classmolpro_1_1vector_1_1MyIterator.html</anchorfile>
      <anchor>a78a087f86d53465e1230e84a646b7e12</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>T</type>
      <name>value_type</name>
      <anchorfile>classmolpro_1_1vector_1_1MyIterator.html</anchorfile>
      <anchor>a0292edcf2b5fd99ad00acbd9cb039015</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>T</type>
      <name>element_type</name>
      <anchorfile>classmolpro_1_1vector_1_1MyIterator.html</anchorfile>
      <anchor>a13d55a86fb2ea74c45f6ba9ce8f6dccb</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::ptrdiff_t</type>
      <name>difference_type</name>
      <anchorfile>classmolpro_1_1vector_1_1MyIterator.html</anchorfile>
      <anchor>a599d58dffcd859ccb34e1a18ff2650c8</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>T *</type>
      <name>pointer</name>
      <anchorfile>classmolpro_1_1vector_1_1MyIterator.html</anchorfile>
      <anchor>ad9d93947bf59bf712c51330c141e6e76</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>T &amp;</type>
      <name>reference</name>
      <anchorfile>classmolpro_1_1vector_1_1MyIterator.html</anchorfile>
      <anchor>a83a363b35ac0a8d1495daa7981ee2a04</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>MyIterator</name>
      <anchorfile>classmolpro_1_1vector_1_1MyIterator.html</anchorfile>
      <anchor>a634a7ca62af470bcb2d588eb216bf1ad</anchor>
      <arglist>() noexcept</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>MyIterator</name>
      <anchorfile>classmolpro_1_1vector_1_1MyIterator.html</anchorfile>
      <anchor>a934c6877328433b4ae05bff590288988</anchor>
      <arglist>(pointer ptr)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>MyIterator</name>
      <anchorfile>classmolpro_1_1vector_1_1MyIterator.html</anchorfile>
      <anchor>a65ae26308160b763eb74d13b8e4ccac3</anchor>
      <arglist>(const MyIterator &amp;)=default</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>MyIterator</name>
      <anchorfile>classmolpro_1_1vector_1_1MyIterator.html</anchorfile>
      <anchor>ac9a1be1cf29d99d21e8e0d2942480cc9</anchor>
      <arglist>(const MyIterator&lt; false &gt; &amp;rhs)</arglist>
    </member>
    <member kind="function">
      <type>reference</type>
      <name>operator*</name>
      <anchorfile>classmolpro_1_1vector_1_1MyIterator.html</anchorfile>
      <anchor>aeead8745cb2f8d0a0b50df55acefed0e</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>pointer</type>
      <name>operator-&gt;</name>
      <anchorfile>classmolpro_1_1vector_1_1MyIterator.html</anchorfile>
      <anchor>aecefb63d8db3f3ca86b865450b330fd6</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>MyIterator &amp;</type>
      <name>operator++</name>
      <anchorfile>classmolpro_1_1vector_1_1MyIterator.html</anchorfile>
      <anchor>aa4598c5f7b9989fbca8c1f6425f66051</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>MyIterator</type>
      <name>operator++</name>
      <anchorfile>classmolpro_1_1vector_1_1MyIterator.html</anchorfile>
      <anchor>a8e18d63e2f15627f015a54c146f8ade2</anchor>
      <arglist>(int)</arglist>
    </member>
    <member kind="function">
      <type>MyIterator &amp;</type>
      <name>operator--</name>
      <anchorfile>classmolpro_1_1vector_1_1MyIterator.html</anchorfile>
      <anchor>ad40f465d0719f4b3b8ae1bd6d5b3559e</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>MyIterator</type>
      <name>operator--</name>
      <anchorfile>classmolpro_1_1vector_1_1MyIterator.html</anchorfile>
      <anchor>abca16f8876ff2005af0fbb271030e2f2</anchor>
      <arglist>(int)</arglist>
    </member>
    <member kind="function">
      <type>MyIterator &amp;</type>
      <name>operator+=</name>
      <anchorfile>classmolpro_1_1vector_1_1MyIterator.html</anchorfile>
      <anchor>a7a019ba091d1630457b8021b905197b5</anchor>
      <arglist>(difference_type n)</arglist>
    </member>
    <member kind="function">
      <type>MyIterator &amp;</type>
      <name>operator-=</name>
      <anchorfile>classmolpro_1_1vector_1_1MyIterator.html</anchorfile>
      <anchor>a84996b4a51efdab07c2a21bbd968eb67</anchor>
      <arglist>(difference_type n)</arglist>
    </member>
    <member kind="friend">
      <type>friend class</type>
      <name>MyIterator&lt; true &gt;</name>
      <anchorfile>classmolpro_1_1vector_1_1MyIterator.html</anchorfile>
      <anchor>aa994fbfa2f35113829261b203072388a</anchor>
      <arglist></arglist>
    </member>
    <member kind="friend">
      <type>friend class</type>
      <name>MyIterator&lt; false &gt;</name>
      <anchorfile>classmolpro_1_1vector_1_1MyIterator.html</anchorfile>
      <anchor>ac223f0f27ba0955878dd8100332c3c53</anchor>
      <arglist></arglist>
    </member>
    <member kind="friend">
      <type>friend MyIterator</type>
      <name>operator+</name>
      <anchorfile>classmolpro_1_1vector_1_1MyIterator.html</anchorfile>
      <anchor>af7c34b09ca9b818939012ec2a54cfef9</anchor>
      <arglist>(difference_type n, const MyIterator &amp;rhs)</arglist>
    </member>
    <member kind="friend">
      <type>friend MyIterator</type>
      <name>operator+</name>
      <anchorfile>classmolpro_1_1vector_1_1MyIterator.html</anchorfile>
      <anchor>a1a22f8292663fc822f409451116b753d</anchor>
      <arglist>(const MyIterator &amp;rhs, difference_type n)</arglist>
    </member>
    <member kind="friend">
      <type>friend MyIterator</type>
      <name>operator-</name>
      <anchorfile>classmolpro_1_1vector_1_1MyIterator.html</anchorfile>
      <anchor>af9ddcdffd9c8207a0f20aacb86810337</anchor>
      <arglist>(difference_type n, const MyIterator &amp;rhs)</arglist>
    </member>
    <member kind="friend">
      <type>friend MyIterator</type>
      <name>operator-</name>
      <anchorfile>classmolpro_1_1vector_1_1MyIterator.html</anchorfile>
      <anchor>a2ae96d2063fa64e78801593f6c497575</anchor>
      <arglist>(const MyIterator &amp;rhs, difference_type n)</arglist>
    </member>
    <member kind="friend">
      <type>friend bool</type>
      <name>operator==</name>
      <anchorfile>classmolpro_1_1vector_1_1MyIterator.html</anchorfile>
      <anchor>ab3184c5b2ee73e8c248e90212c447823</anchor>
      <arglist>(const MyIterator &amp;lhs, const MyIterator &amp;rhs)</arglist>
    </member>
    <member kind="friend">
      <type>friend bool</type>
      <name>operator!=</name>
      <anchorfile>classmolpro_1_1vector_1_1MyIterator.html</anchorfile>
      <anchor>ac20abf02b27483d2a95b2e5e6e50255b</anchor>
      <arglist>(const MyIterator &amp;lhs, const MyIterator &amp;rhs)</arglist>
    </member>
    <member kind="friend">
      <type>friend bool</type>
      <name>operator&lt;</name>
      <anchorfile>classmolpro_1_1vector_1_1MyIterator.html</anchorfile>
      <anchor>ae3199281f4d5b5b46c242ca3d5347564</anchor>
      <arglist>(const MyIterator &amp;lhs, const MyIterator &amp;rhs)</arglist>
    </member>
    <member kind="friend">
      <type>friend bool</type>
      <name>operator&gt;</name>
      <anchorfile>classmolpro_1_1vector_1_1MyIterator.html</anchorfile>
      <anchor>a542f86c229f7cca49fd98e1159055044</anchor>
      <arglist>(const MyIterator &amp;lhs, const MyIterator &amp;rhs)</arglist>
    </member>
    <member kind="friend">
      <type>friend bool</type>
      <name>operator&lt;=</name>
      <anchorfile>classmolpro_1_1vector_1_1MyIterator.html</anchorfile>
      <anchor>a4335d6a63b8709b430688fd9a288ce47</anchor>
      <arglist>(const MyIterator &amp;lhs, const MyIterator &amp;rhs)</arglist>
    </member>
    <member kind="friend">
      <type>friend bool</type>
      <name>operator&gt;=</name>
      <anchorfile>classmolpro_1_1vector_1_1MyIterator.html</anchorfile>
      <anchor>a979457ed52a3a7eef09ecf9094b124c7</anchor>
      <arglist>(const MyIterator &amp;lhs, const MyIterator &amp;rhs)</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::Options</name>
    <filename>classmolpro_1_1Options.html</filename>
    <member kind="function">
      <type></type>
      <name>Options</name>
      <anchorfile>classmolpro_1_1Options.html</anchorfile>
      <anchor>a7e2224a866b3107fe23a1cdf53122d6f</anchor>
      <arglist>(std::string program, std::string input=&quot;&quot;)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>Options</name>
      <anchorfile>classmolpro_1_1Options.html</anchorfile>
      <anchor>a9206817eaa278e2129641f53e81234d2</anchor>
      <arglist>(std::string program, int argc, char *argv[])</arglist>
    </member>
    <member kind="function">
      <type>std::vector&lt; int &gt;</type>
      <name>parameter</name>
      <anchorfile>classmolpro_1_1Options.html</anchorfile>
      <anchor>a782b6fa1d9b0243687b976a78a0b1480</anchor>
      <arglist>(const std::string &amp;key, const std::vector&lt; int &gt; &amp;def) const</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>parameter</name>
      <anchorfile>classmolpro_1_1Options.html</anchorfile>
      <anchor>a5d098500f323bc89e23848a91c733478</anchor>
      <arglist>(const std::string &amp;key, int def=0) const</arglist>
    </member>
    <member kind="function">
      <type>std::vector&lt; double &gt;</type>
      <name>parameter</name>
      <anchorfile>classmolpro_1_1Options.html</anchorfile>
      <anchor>a30de42aad8464d257c3d6e92ed427851</anchor>
      <arglist>(const std::string &amp;key, const std::vector&lt; double &gt; &amp;def) const</arglist>
    </member>
    <member kind="function">
      <type>double</type>
      <name>parameter</name>
      <anchorfile>classmolpro_1_1Options.html</anchorfile>
      <anchor>af5cc4e103a7b8d589e7366854c9caf05</anchor>
      <arglist>(const std::string &amp;key, double def) const</arglist>
    </member>
    <member kind="function">
      <type>std::vector&lt; std::string &gt;</type>
      <name>parameter</name>
      <anchorfile>classmolpro_1_1Options.html</anchorfile>
      <anchor>a094d1b3403120ce28928cd8d72354282</anchor>
      <arglist>(const std::string &amp;key, const std::vector&lt; std::string &gt; &amp;def, bool molpro_parameter=false) const</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>parameter</name>
      <anchorfile>classmolpro_1_1Options.html</anchorfile>
      <anchor>a9397ac61a847cb9fe4b7eed65bafab10</anchor>
      <arglist>(const std::string &amp;key, const std::string &amp;def) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>addParameter</name>
      <anchorfile>classmolpro_1_1Options.html</anchorfile>
      <anchor>a84cf0592cc4e1878834b715375f53d65</anchor>
      <arglist>(const std::string &amp;key, const std::vector&lt; std::string &gt; &amp;values, bool echo=false)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>addParameter</name>
      <anchorfile>classmolpro_1_1Options.html</anchorfile>
      <anchor>af254df5d0ae62659de510190908e9ac6</anchor>
      <arglist>(const std::string &amp;key, const std::vector&lt; int &gt; &amp;values, bool echo=false)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>addParameter</name>
      <anchorfile>classmolpro_1_1Options.html</anchorfile>
      <anchor>a1a6b4d291da89445088143dc1fdb82cd</anchor>
      <arglist>(const std::string &amp;key, const std::vector&lt; double &gt; &amp;values, bool echo=false)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>addParameter</name>
      <anchorfile>classmolpro_1_1Options.html</anchorfile>
      <anchor>a4062e224682acc63a56faaf5b7e59ef0</anchor>
      <arglist>(const std::string &amp;key, const std::string &amp;value, bool echo=false)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>addParameter</name>
      <anchorfile>classmolpro_1_1Options.html</anchorfile>
      <anchor>a18260b7b70bb66e60860b7810914073e</anchor>
      <arglist>(const std::string &amp;key, const int &amp;value, bool echo=false)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>addParameter</name>
      <anchorfile>classmolpro_1_1Options.html</anchorfile>
      <anchor>a078da3251006a95bc6f537b723bcd9c8</anchor>
      <arglist>(const std::string &amp;key, const double &amp;value, bool echo=false)</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>data</name>
      <anchorfile>classmolpro_1_1Options.html</anchorfile>
      <anchor>a5f96f4eafc666739a95ed3426a6bd295</anchor>
      <arglist>() const</arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::pointer_holder</name>
    <filename>classmolpro_1_1pointer__holder.html</filename>
    <templarg>typename T</templarg>
    <templarg>typename _Alloc</templarg>
    <member kind="function">
      <type></type>
      <name>pointer_holder</name>
      <anchorfile>classmolpro_1_1pointer__holder.html</anchorfile>
      <anchor>a6acc157dba03110241169ea509b0dae8</anchor>
      <arglist>(T *const ptr)</arglist>
    </member>
    <member kind="variable">
      <type>T *</type>
      <name>m_ptr</name>
      <anchorfile>classmolpro_1_1pointer__holder.html</anchorfile>
      <anchor>aba99ab51dba083ac8ad576228ca242ef</anchor>
      <arglist></arglist>
    </member>
  </compound>
  <compound kind="class">
    <name>molpro::vector</name>
    <filename>classmolpro_1_1vector.html</filename>
    <templarg>typename T</templarg>
    <templarg>typename _Alloc</templarg>
    <class kind="class">molpro::vector::MyIterator</class>
    <member kind="typedef">
      <type>MyIterator&lt; false &gt;</type>
      <name>Iterator</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a9e4acb3d9c31e3a7642694a80061f7f1</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>MyIterator&lt; true &gt;</type>
      <name>ConstIterator</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a3d408acc087f967dd0a3f74a6c5a9674</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>Iterator</type>
      <name>iterator</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a2f3ee1c6be953a12510cdf511d257c4d</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>ConstIterator</type>
      <name>const_iterator</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a1b89cf2a5c12f8735fc99f72d4702c3b</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::reverse_iterator&lt; Iterator &gt;</type>
      <name>reverse_iterator</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a46814564340044ff309fc61fea75c4f5</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::reverse_iterator&lt; ConstIterator &gt;</type>
      <name>const_reverse_iterator</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a2285a84538efd21973a506ba6a3a89b5</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>vector</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a6e7b8d78f24e0e59081619507305bf81</anchor>
      <arglist>(size_t const length=0)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>vector</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a0b72962083da77f22222ab49fc2b09cc</anchor>
      <arglist>(size_t const length, const T &amp;value)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>vector</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a2d7ce29c6ec93ac2fb9eb01f5d7d2b42</anchor>
      <arglist>(InputIterator first, InputIterator last)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>vector</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a0f612f9a8c74e85d5308df927bae1a95</anchor>
      <arglist>(std::initializer_list&lt; T &gt; il)</arglist>
    </member>
    <member kind="function">
      <type></type>
      <name>vector</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>acc06d6ac6ac531350e8e2249b2c25ef6</anchor>
      <arglist>(const vector&lt; T, _Alloc &gt; &amp;source)</arglist>
    </member>
    <member kind="function">
      <type>vector &amp;</type>
      <name>operator=</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a0c9a4df7c88de84dc799d7043f25ef9f</anchor>
      <arglist>(const vector&lt; T, _Alloc &gt; &amp;copy)</arglist>
    </member>
    <member kind="function" virtualness="virtual">
      <type>virtual</type>
      <name>~vector</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>aedca93866bcdbefaffee3da8e80dc987</anchor>
      <arglist>()=default</arglist>
    </member>
    <member kind="function">
      <type>T &amp;</type>
      <name>operator[]</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>ad080b4e0f3c5c889c2eef2fe0442497e</anchor>
      <arglist>(size_t n)</arglist>
    </member>
    <member kind="function">
      <type>const T &amp;</type>
      <name>operator[]</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>ac6b33f2aeed6b9d097f8729307d0f0d4</anchor>
      <arglist>(size_t n) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>assign</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a3606f477caa946498d4dd955357e0a48</anchor>
      <arglist>(InputIterator first, InputIterator last)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>assign</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>ad24c85d97cd7be05103a06bd0a9b2e17</anchor>
      <arglist>(const T &amp;value)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>assign</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>aecb09ba5e09389176023503c3d80c04c</anchor>
      <arglist>(size_t n, const T &amp;value)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>assign</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a390b1e48c3c84a3f5d0272e538bff137</anchor>
      <arglist>(std::initializer_list&lt; T &gt; il)</arglist>
    </member>
    <member kind="function">
      <type>T &amp;</type>
      <name>at</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>ae281f0c01bb3892684d919ccbd0ac2bf</anchor>
      <arglist>(size_t n)</arglist>
    </member>
    <member kind="function">
      <type>const T &amp;</type>
      <name>at</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>ae03688a59ccf5eb60d2427375b39c264</anchor>
      <arglist>(size_t n) const</arglist>
    </member>
    <member kind="function">
      <type>T &amp;</type>
      <name>back</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a929d0f65ce6f6c51fe2bbe6e30d4811f</anchor>
      <arglist>() noexcept</arglist>
    </member>
    <member kind="function">
      <type>const T &amp;</type>
      <name>back</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a93dec80dad048cd8339fdaccda00bd04</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>capacity</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>ab35ac10f8c19307c9042b2ae73dfa4a5</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>clear</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a393a0facda0a79e1c2b064acbaedba90</anchor>
      <arglist>() noexcept</arglist>
    </member>
    <member kind="function">
      <type>bool</type>
      <name>empty</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a23d0b6f282f7fe8e14f4dfac576cc9a0</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>T &amp;</type>
      <name>front</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a56a2f0e872de31a1b72ef64f153ad88c</anchor>
      <arglist>() noexcept</arglist>
    </member>
    <member kind="function">
      <type>const T &amp;</type>
      <name>front</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>af59acc1e928d788db771f620ed03ac5a</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>T *</type>
      <name>data</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a3609dc53b26319f6d11cc0244767a337</anchor>
      <arglist>() noexcept</arglist>
    </member>
    <member kind="function">
      <type>const T *</type>
      <name>data</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a9711fc1b9f5d076cd745e7acc6639745</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>max_size</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>acf97ebed0bf6156b8093213c0653a7a4</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>size_t</type>
      <name>size</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a7d311344b960e56d56a28fb0365a7aef</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>swap</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a1afe287e1999046207863ee2a51218a4</anchor>
      <arglist>(vector&lt; T, _Alloc &gt; &amp;x) noexcept</arglist>
    </member>
    <member kind="function">
      <type>iterator</type>
      <name>begin</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a5a6da4851d1b31ba004f700d56dc3383</anchor>
      <arglist>() noexcept</arglist>
    </member>
    <member kind="function">
      <type>const_iterator</type>
      <name>begin</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a7bb6dc457bc5203033b6929862c71182</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>const_iterator</type>
      <name>cbegin</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a80039b27ccc550627a2bd737d883c3c5</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>iterator</type>
      <name>end</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a18e3d0d5edd146624f19c2585b2fdbc9</anchor>
      <arglist>() noexcept</arglist>
    </member>
    <member kind="function">
      <type>const_iterator</type>
      <name>end</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>ad057f3254542765637289dd58bbb19eb</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>const_iterator</type>
      <name>cend</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a802bae6a4b2840bf067249320c22eb17</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>reverse_iterator</type>
      <name>rbegin</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a475bee80227088d24369f70b90beb449</anchor>
      <arglist>() noexcept</arglist>
    </member>
    <member kind="function">
      <type>const_reverse_iterator</type>
      <name>rbegin</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>abf136f0ec3f9c1c2125f1d069b4f4e79</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>const_reverse_iterator</type>
      <name>crbegin</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>ae6c54bce2ad86c49f9797756a5c1b3c4</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>reverse_iterator</type>
      <name>rend</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a23ff39d5cff15cfaaba8d49c7206a71b</anchor>
      <arglist>() noexcept</arglist>
    </member>
    <member kind="function">
      <type>const_reverse_iterator</type>
      <name>rend</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>aeddfc7b3795961dba0fafcb0f7826908</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>const_reverse_iterator</type>
      <name>crend</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>af97d28649562011df8eab5912c1c2bda</anchor>
      <arglist>() const noexcept</arglist>
    </member>
    <member kind="function">
      <type>iterator</type>
      <name>erase</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>aab3af03e3ad88a05ace508c01c602fc0</anchor>
      <arglist>(const_iterator pos)</arglist>
    </member>
    <member kind="function">
      <type>iterator</type>
      <name>erase</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a409e77b03d336b075934a2c6f4b40e18</anchor>
      <arglist>(const_iterator first, const_iterator last)</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>str</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a273b2bdc094dc275a7bbc089fb4850b9</anchor>
      <arglist>(int verbosity=1, unsigned int columns=UINT_MAX) const</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>reserve</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a7e664fe018003839f058f47a01a82a74</anchor>
      <arglist>(size_t new_cap)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>resize</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a14f87d6393826102706fb933b3621dda</anchor>
      <arglist>(size_t n)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>resize</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a8242962decaae53db336987ceb6531b9</anchor>
      <arglist>(size_t n, const T &amp;val)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>shrink_to_fit</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a42f8ebfd22d099e23f8111379f790ed5</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>pop_back</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>aec13e6a6799105ca26efe98db1a39c4b</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>push_back</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a9ac9d81dbf7d0505a3c09461b0886ac1</anchor>
      <arglist>(const T &amp;value)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>push_back</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a175b64ba93132abc9976a64d95e2121a</anchor>
      <arglist>(T &amp;&amp;value)</arglist>
    </member>
    <member kind="function">
      <type>void</type>
      <name>emplace_back</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a5472767406ade16337b81d11a5743a04</anchor>
      <arglist>(Args &amp;&amp;... args)</arglist>
    </member>
    <member kind="function">
      <type>iterator</type>
      <name>emplace</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a1ee1f794f36663ab0b688f4fe8917dcd</anchor>
      <arglist>(const_iterator pos, Args &amp;&amp;... args)</arglist>
    </member>
    <member kind="friend">
      <type>friend void</type>
      <name>swap</name>
      <anchorfile>classmolpro_1_1vector.html</anchorfile>
      <anchor>a4e207ab81b1c8d2b4e7b3b690be8fcb7</anchor>
      <arglist>(vector&lt; T, _Alloc &gt; &amp;a, vector&lt; T, _Alloc &gt; &amp;b) noexcept</arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>molpro</name>
    <filename>namespacemolpro.html</filename>
    <namespace>molpro::mpi</namespace>
    <namespace>molpro::memory</namespace>
    <class kind="class">molpro::Options</class>
    <class kind="struct">molpro::_EmptyBase_</class>
    <class kind="class">molpro::allocator_</class>
    <class kind="class">molpro::pointer_holder</class>
    <class kind="class">molpro::vector</class>
    <class kind="class">molpro::array</class>
    <class kind="class">molpro::bytestream</class>
    <member kind="typedef">
      <type>allocator_&lt; T &gt;</type>
      <name>allocator</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>abdffe5c2e1901050cdb4dcc4e23d72f6</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>std::vector&lt; T, A &gt;</type>
      <name>stdvector</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>a37b62503c8a32175b5963558c7b29173</anchor>
      <arglist></arglist>
    </member>
    <member kind="typedef">
      <type>int32_t</type>
      <name>fint</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>a966c08c826366d2c898fbfa573d43699</anchor>
      <arglist></arglist>
    </member>
    <member kind="function">
      <type>std::ostream &amp;</type>
      <name>operator&lt;&lt;</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>ab3ceb92ca3a8843bdbed20494e040d6c</anchor>
      <arglist>(std::ostream &amp;os, vector&lt; T, _Alloc &gt; const &amp;obj)</arglist>
    </member>
    <member kind="function">
      <type>std::ptrdiff_t</type>
      <name>operator-</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>ab6cb0c31e2caae37e01214de4881d10b</anchor>
      <arglist>(const pointer_holder&lt; T &gt; &amp;a, const pointer_holder&lt; T &gt; &amp;b)</arglist>
    </member>
    <member kind="function">
      <type>std::ostream &amp;</type>
      <name>operator&lt;&lt;</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>a3006216675549d7aac6a8f30134c1367</anchor>
      <arglist>(std::ostream &amp;os, array&lt; T &gt; const &amp;obj)</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>args</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>ac71f769930e14778d178cec645519b90</anchor>
      <arglist>(int argc, char **argv)</arglist>
    </member>
    <member kind="function">
      <type>std::string</type>
      <name>upcase</name>
      <anchorfile>namespacemolpro.html</anchorfile>
      <anchor>ac8e0c66cd41d789b8fdc257dd445a5ea</anchor>
      <arglist>(const std::string &amp;s)</arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>molpro::memory</name>
    <filename>namespacemolpro_1_1memory.html</filename>
    <namespace>molpro::memory::detail</namespace>
  </compound>
  <compound kind="namespace">
    <name>molpro::memory::detail</name>
    <filename>namespacemolpro_1_1memory_1_1detail.html</filename>
    <member kind="function">
      <type>size_t &amp;</type>
      <name>used</name>
      <anchorfile>namespacemolpro_1_1memory_1_1detail.html</anchorfile>
      <anchor>ac4351a0f3532e6feff11d4095b3c1206</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>size_t &amp;</type>
      <name>maximum_allocatable</name>
      <anchorfile>namespacemolpro_1_1memory_1_1detail.html</anchorfile>
      <anchor>aacebd2733c6471d0a6b10034a4d7148c</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>std::unordered_map&lt; char *, size_t &gt; &amp;</type>
      <name>lengths</name>
      <anchorfile>namespacemolpro_1_1memory_1_1detail.html</anchorfile>
      <anchor>a8751f754c53f37d472cce858f5d766b4</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="namespace">
    <name>molpro::mpi</name>
    <filename>namespacemolpro_1_1mpi.html</filename>
    <member kind="function">
      <type>MPI_Comm</type>
      <name>comm_self</name>
      <anchorfile>namespacemolpro_1_1mpi.html</anchorfile>
      <anchor>a47547d4cda8dce46ff57c70fe1587cc8</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>MPI_Comm</type>
      <name>comm_global</name>
      <anchorfile>namespacemolpro_1_1mpi.html</anchorfile>
      <anchor>abce7e703339ee4ffdc2062219fa206ce</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>size_global</name>
      <anchorfile>namespacemolpro_1_1mpi.html</anchorfile>
      <anchor>aecf7017ca7ecdd4e8228167f721c09cc</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>rank_global</name>
      <anchorfile>namespacemolpro_1_1mpi.html</anchorfile>
      <anchor>a93ec5ec29948bca90660e2140ff63a40</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>init</name>
      <anchorfile>namespacemolpro_1_1mpi.html</anchorfile>
      <anchor>adedbdd68795cb1a6142c412bf34bbc4f</anchor>
      <arglist>()</arglist>
    </member>
    <member kind="function">
      <type>int</type>
      <name>finalize</name>
      <anchorfile>namespacemolpro_1_1mpi.html</anchorfile>
      <anchor>a116d1a866287c06ca0fbd07ad4c35788</anchor>
      <arglist>()</arglist>
    </member>
  </compound>
  <compound kind="dir">
    <name>/__w</name>
    <path>/__w/</path>
    <filename>dir_3a0534501ca4be4079425efd3c8ffab8.html</filename>
    <dir>/__w/utilities</dir>
  </compound>
  <compound kind="dir">
    <name>/home/runner/work/utilities/utilities/build/src/molpro/memory</name>
    <path>/home/runner/work/utilities/utilities/build/src/molpro/memory/</path>
    <filename>dir_591580345ece921c54765e5245d2c662.html</filename>
    <file>memory-config.h</file>
  </compound>
  <compound kind="dir">
    <name>/__w/utilities/utilities/src/molpro</name>
    <path>/__w/utilities/utilities/src/molpro/</path>
    <filename>dir_b7f09782393db6b6e812fa9cfba5b32f.html</filename>
    <file>bytestreamC.cpp</file>
    <file>bytestreamC.h</file>
    <file>cblas.h</file>
    <file>iostream.h</file>
    <file>lapacke.h</file>
    <file>memory.h</file>
    <file>memoryC.cpp</file>
    <file>mpi.h</file>
    <file>Options.cpp</file>
    <file>Options.h</file>
  </compound>
  <compound kind="dir">
    <name>/home/runner/work/utilities/utilities/build/src/molpro</name>
    <path>/home/runner/work/utilities/utilities/build/src/molpro/</path>
    <filename>dir_e10268cf193aca5502aa6c8910e3741b.html</filename>
    <dir>/home/runner/work/utilities/utilities/build/src/molpro/memory</dir>
  </compound>
  <compound kind="dir">
    <name>/__w/utilities/utilities/src</name>
    <path>/__w/utilities/utilities/src/</path>
    <filename>dir_64359fa6a44350e94b4e2e5b1e766613.html</filename>
    <dir>/__w/utilities/utilities/src/molpro</dir>
  </compound>
  <compound kind="dir">
    <name>/home/runner/work/utilities/utilities/build/src</name>
    <path>/home/runner/work/utilities/utilities/build/src/</path>
    <filename>dir_f1b4c3c9d4497c305bc4069d03d8d4ec.html</filename>
    <dir>/home/runner/work/utilities/utilities/build/src/molpro</dir>
  </compound>
  <compound kind="dir">
    <name>/__w/utilities</name>
    <path>/__w/utilities/</path>
    <filename>dir_3a226b0dd7878ac8cf20da0c06f05947.html</filename>
    <dir>/__w/utilities/utilities</dir>
  </compound>
  <compound kind="dir">
    <name>/__w/utilities/utilities</name>
    <path>/__w/utilities/utilities/</path>
    <filename>dir_49596074060651a736bb4ff8232adf25.html</filename>
    <dir>/__w/utilities/utilities/src</dir>
  </compound>
</tagfile>
